require 'google_translate'

module LanguageMixer::Translator
  class GoogleTranslate

    attr_reader :client

    attr_accessor :source_language, :target_language
    
    def initialize
      @client = ::GoogleTranslate.new
    end

    def translate(text)
      raise("Missing 'from' language") unless source_language
      raise("Missing 'to' language") unless target_language
      raise("Missing text for translation") unless text
      res = client.translate source_language, target_language, text
      res[0][0][0]
    end

  end
end
