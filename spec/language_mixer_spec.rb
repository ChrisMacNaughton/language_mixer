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
    end

    it "can successfully translate a file" do
      file = LanguageMixer::File.new('spec/fixtures/test_file_2.md')
      file_contents = file.text
      result = LanguageMixer.translate('spec/fixtures/test_file_2.md', false)
      expect(result).not_to eq(file_contents)
    end
  end
 
end