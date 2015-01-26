require 'yandex-translator'
module LanguageMixer::Translator
  class YandexTranslate < Translate
    
    def initialize(token)
      @client = Yandex::Translator.new(token)
    end

    private

    def call_translate(text)
      client.translate text, from: source_language, to: target_language
    end

  end
end
