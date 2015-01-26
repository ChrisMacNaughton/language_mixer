require 'bing_translator'

module LanguageMixer::Translator
  class MicrosoftTranslate < Translate
    
    def initialize(client_id, client_secret)
      @client = BingTranslator.new(client_id, client_secret)
    end

    def translate(text)
      raise("Missing 'from' language") unless source_language
      raise("Missing 'to' language") unless target_language
      raise("Missing text for translation") unless text
      client.translate text, from: source_language, to: target_language
    end

  end
end
