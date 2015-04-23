# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bingxiang/version'

Gem::Specification.new do |spec|
  spec.name          = "bingxiang"
  spec.version       = Bingxiang::VERSION
  spec.authors       = ["Li Chen"]
  spec.email         = ["lic@cycling.local"]

  spec.summary       = %q{Small utility to collect background images from bing.com}
  spec.description   = %q{It should be run daily as bing.com provide different image every day.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "thor", "~> 0.19.0"
  spec.add_dependency "pry", "~> 0.10.1"
  spec.add_dependency "selenium-webdriver", "~> 2.45.0"
  spec.add_dependency "httparty", "0.13.3"
end
