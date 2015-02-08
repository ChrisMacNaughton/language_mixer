require "spec_helper"

module LanguageMixer
  describe File do
    before do
      @file = LanguageMixer::File.new('spec/fixtures/test_file.md')
    end
    it "parses configuration" do
      yaml_config = {"source_language"=>"en", "target_language"=>["fr", "en", "es", "en", "de", "en"]}
      expect(@file.yaml_settings).to eq(yaml_config)
    end

    it "reads contents correctly" do
      contents = "This is a test file for my gem.\n\nWhere does it all go?!"
      file_contents = @file.text
      expect(file_contents).to eq(contents)
    end


    after :each do
      LanguageMixer.reset
    end
  end
end