require 'google_translate'

module LanguageMixer::Translator
  class Translate
    attr_reader :client

    attr_accessor :source_language, :target_language

    def translate(text)
      raise("Missing 'from' language") unless source_language
      raise("Missing 'to' language") unless target_language
      raise("Missing text for translation") unless text
      # puts "#{self.class.to_s} About to translate \n\t'#{text}'\n from #{source_language} to #{target_language}"
      call_translate(text)
    end
  end
end
