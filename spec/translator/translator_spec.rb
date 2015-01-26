require 'spec_helper'
describe LanguageMixer::Translator::Translate do
  before :each do
    @client = LanguageMixer::Translator::Translate.new
    @client.target_language = 'es'
    @client.source_language = 'en'
  end

  it "knows it's source language" do
    expect(@client.source_language).to eq('en')
  end

  it "knows it's target language" do
    expect(@client.target_language).to eq('es')
  end

  it 'can change target language' do
    @client.target_language = 'it'
    expect(@client.target_language).to eq('it')
  end

  it 'can change source language' do
    @client.source_language = 'it'
    expect(@client.source_language).to eq('it')
  end
end