# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sufler/version'

Gem::Specification.new do |spec|
  spec.name          = "sufler"
  spec.version       = Sufler::VERSION
  spec.authors       = ["Piotr Laszewski"]
  spec.email         = ["laszpio@gmail.com"]
  spec.summary       = %q{Simple webvtt wrapper}
  spec.description   = %q{Simple webvtt wrapper}
  spec.homepage      = "https://github.com/laszpio/sufler"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
