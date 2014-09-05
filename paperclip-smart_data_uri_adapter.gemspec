# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip'
require 'paperclip/smart_data_uri_adapter/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip-smart_data_uri_adapter"
  spec.version       = Paperclip::SmartDataUriAdapter::VERSION
  spec.authors       = ["Ronald Maravilla"]
  spec.email         = ["rmaravilla@payrollhero.com"]
  spec.summary       = %q{Smarter Paperclip::DataUriAdapter}
  spec.description   = %q{
    Smarter Paperclip::DataUriAdapter that guesses the file extension to use instead of just naming everything
    as base64.txt.
  }
  spec.homepage      = "https://github.com/payrollhero/paperclip-smart_data_uri_adapter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "paperclip"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "minitest-reporters"
end
