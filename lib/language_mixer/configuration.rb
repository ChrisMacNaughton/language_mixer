module LanguageMixer
  class Configuration
    attr_accessor :yandex_api_key, :bing_app_token, :bing_api_secret

    def to_s
      h = {}
      h[:yandex_api_key] = yandex_api_key if yandex_api_key
      h[:bing_app_token] =  bing_app_token if bing_app_token
      h[:bing_api_secret] =  bing_api_secret.gsub(/.+!(....$)/, '') if bing_api_secret
      h.inspect
    end

    def == other
      return false unless other.yandex_api_key == yandex_api_key
      return false unless other.bing_app_token == bing_app_token
      return false unless other.bing_api_secret == bing_api_secret
      true
    end
  end
end