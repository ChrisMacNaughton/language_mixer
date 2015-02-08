require 'yaml'

module LanguageMixer
  class File
    YAML_FRONT_MATTER_REGEXP = /\A(---\s*\n.*?\n?)^((---|\.\.\.)\s*$\n?)/m

    def initialize(filename)
      @filename = filename
    end

    def yaml_settings
      if contents =~ YAML_FRONT_MATTER_REGEXP
        YAML.load contents
      else
        {}
      end
    end

    def text
      tmp = if contents =~ YAML_FRONT_MATTER_REGEXP
        contents.gsub(YAML_FRONT_MATTER_REGEXP, '')
      else
        contents
      end
      tmp.strip
    end

    private

    def contents
      @contents ||= ::File.read(@filename)
    end
  end
  
end