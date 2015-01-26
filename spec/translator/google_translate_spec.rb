require 'spec_helper'
describe LanguageMixer::Translator::GoogleTranslate do
  before :each do
    @client = LanguageMixer::Translator::GoogleTranslate.new
    @client.target_language = 'es'
    @client.source_language = 'en'
  end
  it "Can translate Hello World to Spanish" do
    VCR.use_cassette('Hello World/Google') do
      expect(@client.translate("Hello World")).to eq('Hola Mundo')
    end
  end
end