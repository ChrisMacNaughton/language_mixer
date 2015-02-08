require 'spec_helper'
describe LanguageMixer do
  describe '#configure' do
    before do
      LanguageMixer.configure do |config|
        config.yandex_api_key = 'test1234'
      end
    end

    it 'has an API key for Yandex' do
      expect(LanguageMixer.configuration.yandex_api_key).to eq('test1234')
    end
  end

  describe ".reset" do
    before :each do
      LanguageMixer.configure do |config|
        config.yandex_api_key = 'test1234'
      end
    end

    it "resets the configuration" do
      LanguageMixer.reset

      config = LanguageMixer.configuration

      expect(config.yandex_api_key).to be_nil
    end
  end

  describe ".translate" do
    before :each do
      LanguageMixer.reset
      LanguageMixer.configure do |config|
        config.yandex_api_key = 'test1234'
      end
    end

    it "can successfully translate a file"
  end
 
end