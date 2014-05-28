# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'csvconv/version'

Gem::Specification.new do |spec|
  spec.name          = "csvconv"
  spec.version       = Csvconv::VERSION
  spec.authors       = ["masa21kik"]
  spec.email         = ["masa21kik@gmail.com"]
  spec.description   = %q{CSV converter to JSON, YAML, LTSV}
  spec.summary       = %q{CSV converter to JSON, YAML, LTSV}
  spec.homepage      = "https://github.com/masa21kik/csvconv"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
