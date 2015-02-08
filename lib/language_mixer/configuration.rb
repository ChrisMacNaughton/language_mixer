module LanguageMixer
  class Configuration
    attr_accessor :yandex_api_key, :bing_app_token, :bing_api_secret
    attr_writer :source_language, :target_language

    def to_s
      to_h.inspect
    end

    def == other
      to_h == other.to_h
    end

    def merge(other_hash)
      to_h.merge(other_hash)
    end

    def to_h
      h = {
        source_language: source_language,
        target_language: target_language
      }
      h[:yandex_api_key] = yandex_api_key if yandex_api_key
      h[:bing_app_token] =  bing_app_token if bing_app_token
      h[:bing_api_secret] =  bing_api_secret.gsub(/.+!(....$)/, '') if bing_api_secret
      h
    end

    def target_language
      [*@target_language]
    end

    def source_language
      @source_language || 'en'
    end
  end
end