# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handy_feature_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "handy_feature_helpers"
  spec.version       = HandyFeatureHelpers::VERSION
  spec.authors       = ["Vassil Kalkov"]
  spec.email         = ["vassilkalkov@gmail.com"]
  spec.description   = %q{Feature helpers for use with Capybara and Rspec}
  spec.summary       = %q{Feature spec helpers}
  spec.homepage      = "http://github.com/kalkov/handy_feature_helpers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'capybara'
  spec.add_dependency 'rspec'

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
