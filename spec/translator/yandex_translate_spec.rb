require 'spec_helper'
describe LanguageMixer::Translator::YandexTranslate do
  before :each do
    @client = LanguageMixer::Translator::YandexTranslate.new('This is a secret key')
    @client.target_language = 'es'
    @client.source_language = 'en'
  end
  it "Can translate Hello World to Spanish" do
    VCR.use_cassette('Hello World/Yandex') do
      expect(@client.translate("Hello World")).to eq('Hola Mundo')
    end
  end
end