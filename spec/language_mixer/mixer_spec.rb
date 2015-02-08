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

    after :each do
      LanguageMixer.reset
    end
  end
end