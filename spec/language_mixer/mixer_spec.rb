require "spec_helper"

module LanguageMixer
  describe Mixer do
    before do
      @mixer = LanguageMixer::Mixer.new
    end
    it 'can selectively enable APIs' do
      expect(@mixer.send(:available_apis).length).to eq(1)

      LanguageMixer.configure do |config|
        config.yandex_api_key = 'test1234'
      end

      expect(@mixer.send(:available_apis).length).to eq(2)
    end

    it 'can use multiple APIs' do
      LanguageMixer.configure do |config|
        config.yandex_api_key = 'test1234'
      end
      
      @mixer.source_language = 'en'
      @mixer.target_language = 'es'
      @mixer.text = "Hello World!\nI'm having fun"
      VCR.use_cassette('multi') do
        expect(@mixer.translate).to eq("Hola Mundo!\nMe estoy divirtiendo")

        expect(@mixer.requests.count).to eq(2)
      end
    end

    after :each do
      LanguageMixer.reset
    end
  end
end