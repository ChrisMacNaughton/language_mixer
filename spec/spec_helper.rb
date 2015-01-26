require 'bundler/setup'
Bundler.setup

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'language_mixer' # and any other gems you need

RSpec.configure do |config|
  # some (optional) config here
end