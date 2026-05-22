require_relative "lib/rspec/uuid/version"

Gem::Specification.new do |s|
  s.authors     = ["Daniel Pepper"]
  s.description = "RSpec UUID matcher"
  s.files       = `git ls-files * ':!:spec'`.split("\n")
  s.homepage    = "https://github.com/dpep/rspec-uuid"
  s.license     = "MIT"
  s.name        = "rspec-uuid"
  s.summary     = "RSpec::UUID"
  s.version     = RSpec::UUID::VERSION

  s.required_ruby_version = ">= 3.3"

  s.add_dependency "rspec-expectations", ">= 3"

  s.add_development_dependency "activesupport"
  s.add_development_dependency "debug"
  s.add_development_dependency "faker"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
