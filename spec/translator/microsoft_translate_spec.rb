require 'spec_helper'
describe LanguageMixer::Translator::MicrosoftTranslate do
  before :each do
    @client = LanguageMixer::Translator::MicrosoftTranslate.new('language-mixer-dev', 'placeholder for recording')
    @client.target_language = 'es'
    @client.source_language = 'en'
  end
  it "Can translate Hello World to Spanish" do
    VCR.use_cassette('Hello World/Microsoft') do
      expect(@client.translate("Hello World")).to eq('Hola mundo')
    end
  end
end