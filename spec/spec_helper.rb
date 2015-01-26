require 'bundler/setup'
Bundler.setup

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'vcr'
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
end

require 'language_mixer' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end

