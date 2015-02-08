class LanguageMixer::Mixer
  attr_accessor :text, :source_language, :target_language
  attr_writer :seperator
  
  def translate
    raise("Missing 'from' language") unless source_language
    raise("Missing 'to' language") unless target_language
    raise("Missing text for translation") unless text
    
    index = 0
    available_apis.each do |api|
      api.source_language = source_language
      api.target_language = target_language
    end
    # binding.pry
    prepared_text.each do |line|
      add_text_part available_apis[index].translate(line)
      requests[available_apis[index]] += 1
      index += 1
      index = 0 if index == available_apis.count
    end
    text_parts.join(seperator)
  end

  def request_count
    requests.count
  end

  private

  def seperator
    @seperator ||= "\n"
  end

  def prepared_text
    text.split(seperator)
  end

  def text_parts
    @text_parts ||= []
  end

  def requests
    @requests ||= Hash.new(0)
  end

  def add_text_part(val)
    text_parts << val
  end

  def available_apis
    configuration = LanguageMixer.configuration
    # binding.pry
    if @configuration && @configuration == configuration
      @available_apis
    else
      @configuration = configuration.dup
      @available_apis = begin

        available_apis = [LanguageMixer::Translator::GoogleTranslate.new]
        
        if LanguageMixer.configuration.yandex_api_key
          available_apis << LanguageMixer::Translator::YandexTranslate.new(LanguageMixer.configuration.yandex_api_key)
        end

        if LanguageMixer.configuration.bing_app_token && LanguageMixer.configuration.bing_api_secret
          available_apis << LanguageMixer::Translator::BingTranslate.new(
            LanguageMixer.configuration.bing_app_token,
            LanguageMixer.configuration.bing_api_secret
          )
        end
        available_apis
      end
    end
    @available_apis
  end

end