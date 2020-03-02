# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vat_rate/version"

Gem::Specification.new do |spec|
  spec.name          = "vat-rates"
  spec.version       = VatRate::VERSION
  spec.authors       = ["korrs"]
  spec.email         = ["slavakorr@gmail.com"]

  spec.summary       = %q{Gem for fetching VAT for country by alpha2 country code}
  spec.homepage      = "https://github.com/bookmate/vat-rates"
  spec.license       = 'Nonstandard'

  spec.metadata["allowed_push_host"] = "http://nexus.bookmate.services/repository/bookmate/"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
end
