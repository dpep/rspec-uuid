package_name = File.basename(__FILE__).split(".")[0]
require File.expand_path("lib/#{package_name}/version", __dir__)

package = RSpecUUID


Gem::Specification.new do |s|
  s.name        = package_name
  s.version     = package.const_get "VERSION"
  s.authors     = ["Daniel Pepper"]
  s.summary     = package.to_s
  s.description = "RSpec UUID matcher"
  s.homepage    = "https://github.com/dpep/#{package_name}"
  s.license     = "MIT"

  s.files       = Dir.glob("lib/**/*")
  s.test_files  = Dir.glob("spec/**/*_spec.rb")

  s.add_development_dependency "activesupport"
  s.add_development_dependency "byebug"
  s.add_development_dependency "codecov"
  s.add_development_dependency "faker"
  s.add_development_dependency "rspec"
  s.add_development_dependency "simplecov"
end
