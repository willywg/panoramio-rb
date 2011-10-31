$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "panoramio-rb/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "panoramio-rb"
  s.version     = PanoramioRb::VERSION
  s.authors     = ["William Wong Garay (willywg)"]
  s.email       = ["willywg@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of PanoramioRb."
  s.description = "TODO: Description of PanoramioRb."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"
  s.add_dependency 'json', '1.6.1'
  s.add_dependency 'hashie', '1.2.0'
  s.add_dependency 'rest-client', '1.6.7'

  s.add_development_dependency "sqlite3"
end
