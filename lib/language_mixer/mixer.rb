require 'pry'
class LanguageMixer::Mixer
  attr_accessor :text, :source_language, :target_language
  attr_writer :seperator
  
  def translate
    raise("Missing 'from' language") unless source_language
    raise("Missing 'to' language") unless target_language
    raise("Missing text for translation") unless text
    # puts "Translating #{text}"
    index = 0
    available_apis.each do |api|
      api.source_language = source_language
      api.target_language = target_language
    end
    
    prepared_text.each do |line|
      tries = 0
      begin
        if line == ''
          add_text_part line
        else
          translator = available_apis.sample
          add_text_part translator.translate(line)
        end
      rescue => e
        if tries > 5
          puts "There was a problem translating #{line}\n#{e}"
          return false
        end
        tries += 1
        retry
      end
      requests[translator] += 1
    end
    res = text_parts.map(&:strip).join(seperator).gsub(' , ', ', ').gsub('|||', "\n")

    res
  end

  def request_count
    requests.count
  end

  private

  def seperator
    @seperator ||= "."
  end

  def prepared_text
    text2 = unless seperator == "\n"
      text.gsub("\n", '|||')
    else
      text
    end
    text2.split(seperator)
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
          available_apis << LanguageMixer::Translator::MicrosoftTranslate.new(
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