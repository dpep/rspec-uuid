require "rspec/core"
require "rspec/expectations"
require "rspec-uuid/matchers"
require "rspec-uuid/version"

RSpec.configure do |config|
  config.include(RSpecUUID::Matchers)
end
