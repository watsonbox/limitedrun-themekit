# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'limitedrun-themekit/version'

Gem::Specification.new do |gem|
  gem.name          = "limitedrun-themekit"
  gem.version       = Limitedrun::Themekit::VERSION
  gem.authors       = ["Howard Wilson"]
  gem.email         = ["howard@watsonbox.net"]
  gem.description   = %q{Toolkit for developing Limited Run themes locally}
  gem.summary       = %q{Toolkit for developing Limited Run themes locally. Because Limited Run themes are made up of liquid templates, they easily can't be worked on offline. This gem renders the templates locally using mock data to speed up development.}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rspec", "~> 2.14"
  gem.add_development_dependency "capybara", "~> 2.4.1"

  gem.add_dependency "sinatra", "~> 1.4.0"
  gem.add_dependency "activesupport", ">= 4.0"
  gem.add_dependency "hashie", "~> 3.3.0"
end
