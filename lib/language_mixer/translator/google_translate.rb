require 'google_translate'

module LanguageMixer::Translator
  class GoogleTranslate < Translate

    def initialize
      @client = ::GoogleTranslate.new
    end

    private

    def call_translate(text)
      res = client.translate source_language, target_language, text
      res[0][0][0]
    end

  end
end
