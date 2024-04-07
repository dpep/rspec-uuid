require_relative "lib/rspec/uuid/version"
package = RSpec::UUID
package_name = "rspec-uuid"

Gem::Specification.new do |s|
  s.authors     = ["Daniel Pepper"]
  s.description = "RSpec UUID matcher"
  s.files       = `git ls-files * ':!:spec'`.split("\n")
  s.homepage    = "https://github.com/dpep/#{package_name}"
  s.license     = "MIT"
  s.name        = package_name
  s.summary     = package.to_s
  s.version     = package.const_get "VERSION"

  s.required_ruby_version = ">= 3"

  s.add_dependency "rspec-expectations", ">= 3"

  s.add_development_dependency "activesupport"
  s.add_development_dependency "byebug"
  s.add_development_dependency "faker"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "uuid7"
end
