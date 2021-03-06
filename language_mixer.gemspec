# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'language_mixer/version'

Gem::Specification.new do |spec|
  spec.name          = "language_mixer"
  spec.version       = LanguageMixer::VERSION
  spec.authors       = ["Chris MacNaughton"]
  spec.email         = ["chmacnaughton@gmail.com"]
  spec.summary       = %q{LanguageMixer is a language anonymiser to allow users to disguise their native language}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"

  # Translator API Gems
  spec.add_dependency "bing_translator"
  spec.add_dependency "google-translate"
  spec.add_dependency "yandex-translator"


  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
