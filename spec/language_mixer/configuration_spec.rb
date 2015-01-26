require "spec_helper"

module LanguageMixer
  describe Configuration do
    describe "#yandex_api_key" do
      it "default value is nil" do
        expect(Configuration.new.yandex_api_key).to be_nil
      end
    end

    describe "#yandex_api_key=" do
      it "can set value" do
        config = Configuration.new
        config.yandex_api_key = 'test1234'
        expect(config.yandex_api_key).to eq('test1234')
      end
    end

    describe "#bing_app_token" do
      it "default value is nil" do
        expect(Configuration.new.bing_app_token).to be_nil
      end
    end

    describe "#bing_app_token=" do
      it "can set value" do
        config = Configuration.new
        config.bing_app_token = 'test1234'
        expect(config.bing_app_token).to eq('test1234')
      end
    end

    describe "#bing_api_secret" do
      it "default value is nil" do
        expect(Configuration.new.bing_api_secret).to be_nil
      end
    end

    describe "#bing_api_secret=" do
      it "can set value" do
        config = Configuration.new
        config.bing_api_secret = 'test1234'
        expect(config.bing_api_secret).to eq('test1234')
      end
    end

    after :each do
      LanguageMixer.reset
    end
  end
end