# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/clockwork/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-clockwork"
  spec.version       = Capistrano::Clockwork::VERSION
  spec.authors       = ["Kyle Miller"]
  spec.email         = ["github@backupparachute.com"]
  spec.summary       = %q{Capistrano clockwork plugin.}
  spec.description   = %q{Capistrano tasks to manage clockwork.}
  spec.homepage      = "http://github.com/backupparachute/capistrano-clockwork"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency     "capistrano", "< 3.0"
end
