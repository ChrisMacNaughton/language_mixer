require 'bing_translator'

module LanguageMixer::Translator
  class MicrosoftTranslate < Translate
    
    def initialize(client_id, client_secret)
      @client = BingTranslator.new(client_id, client_secret)
    end

    private

    def call_translate(text)
      client.translate text, from: source_language, to: target_language
    end
  end
end
