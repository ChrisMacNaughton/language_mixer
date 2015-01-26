require "language_mixer/version"
require "language_mixer/translator"
require "language_mixer/configuration"
require "language_mixer/mixer"

module LanguageMixer
  
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end
end
