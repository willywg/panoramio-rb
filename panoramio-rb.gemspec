# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'panoramio-rb/version'

Gem::Specification.new do |spec|
  spec.name          = "panoramio-rb"
  spec.version       = PanoramioRb::VERSION
  spec.authors       = ["William Wong Garay"]
  spec.email         = ["willywg@gmail.com"]

  spec.license       = "MIT"
  spec.homepage      = "https://github.com/willywg/panoramio-rb"
  spec.summary       = "PanoramioRb gem help you to get geolocated photos from Panoramio.com how a Ruby Object."
  spec.description   = "PanoramioRb gem help you to get geolocated photos from Panoramio.com how a Ruby Object."


  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "awesome_print", "~> 1.6", ">= 1.6.1"
  spec.add_dependency "json", "> 1.6.1"
  spec.add_dependency "hashie", "> 1.2.0"
  spec.add_dependency "rest-client", "~> 1.6.7"
  spec.add_dependency "geocoder", "> 1.0.5"
end
