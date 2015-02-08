require 'thor'

module LanguageMixer
  module Cli
    class Application < Thor

      desc 'translate FILE', 'takes FILE as input and, after parsing any included YAML header, translates the content'
      def translate(file)
        LanguageMixer.translate(file)
      end

      desc 'init FILE', 'builds an example FILE to translate'
      def init(file)
        # text = <<-end

        # <<end
        test = 'hello world'
        File.open(file, 'w+'){|f| f.write(text)}
        true
      end
    end
  end
end