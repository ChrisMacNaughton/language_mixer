require "language_mixer/version"
require "language_mixer/translator"
require "language_mixer/configuration"
require "language_mixer/mixer"
require "language_mixer/file"
require "language_mixer/cli/application"


module LanguageMixer
  
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def reset
      @configuration = Configuration.new
    end

    def translate(file, output = 'output.md')
      file = LanguageMixer::File.new(file)
      settings = @configuration.merge file.yaml_settings
      text = file.text
      mixer = LanguageMixer::Mixer.new
      mixer.source_language = settings['source_language']

      settings['target_language'].each do |target_language|
        mixer.text = text
        mixer.target_language = target_language
        text = mixer.translate
        return false unless text
        mixer = LanguageMixer::Mixer.new
        mixer.source_language = target_language
      end
      if output
        ::File.open(output, 'w+'){|f| f.write text }
      else
        text
      end
    end
  end

  
end
