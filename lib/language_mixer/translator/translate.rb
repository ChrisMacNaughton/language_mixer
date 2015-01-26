require 'google_translate'

module LanguageMixer::Translator
  class Translate
    attr_reader :client

    attr_accessor :source_language, :target_language
  end
end
