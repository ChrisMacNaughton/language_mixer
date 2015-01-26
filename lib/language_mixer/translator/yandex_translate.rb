require 'yandex-translator'
module LanguageMixer::Translator
  class YandexTranslate
    attr_reader :client

    attr_accessor :source_language, :target_language
    
    def initialize(token)
      @client = Yandex::Translator.new(token)
    end

    def translate(text)
      raise("Missing 'from' language") unless source_language
      raise("Missing 'to' language") unless target_language
      raise("Missing text for translation") unless text
      client.translate text, from: source_language, to: target_language
    end

  end
end
