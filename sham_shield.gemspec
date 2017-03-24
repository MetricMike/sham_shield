# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sham_shield/version'

Gem::Specification.new do |spec|
  spec.name          = "sham_shield"
  spec.version       = ShamShield::VERSION
  spec.authors       = ["Michael Weigle"]
  spec.email         = ["michael.weigle@gmail.com"]

  spec.summary       = %q{An encouraging process wrapper that texts a ship-it squirrel on completion.}
  spec.homepage      = "https://github.com/metricmike/sham_shield"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "twilio-ruby", "~> 4.11"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
