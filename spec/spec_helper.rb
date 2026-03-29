require "active_support"
require "active_support/core_ext/digest/uuid"
require "debug"
require "faker"
require "rspec"
require "rspec/matchers/fail_matchers"
require "simplecov"

# Backport SecureRandom.uuid_v7 for Ruby < 3.3
unless SecureRandom.respond_to?(:uuid_v7)
  def SecureRandom.uuid_v7
    ms = (Time.now.to_r * 1000).to_i
    rand_a = random_number(0x1000)
    rand_b_hi = random_number(0x4000)
    rand_b_lo = random_number(0x1000000000000)

    "%08x-%04x-7%03x-%04x-%012x" % [
      (ms >> 16) & 0xffffffff,
      ms & 0xffff,
      rand_a,
      0x8000 | (rand_b_hi & 0x3fff),
      rand_b_lo,
    ]
  end
end

SimpleCov.start do
  add_filter "/spec/"
end

if ENV["CI"] == "true" || ENV["CODECOV_TOKEN"]
  require "simplecov_json_formatter"
  SimpleCov.formatter = SimpleCov::Formatter::JSONFormatter
end

# load this gem
gem_name = Dir.glob("*.gemspec")[0].split(".")[0]
require gem_name

RSpec.configure do |config|
  # allow "fit" examples
  config.filter_run_when_matching :focus

  # expect { ... }.to fail
  config.include RSpec::Matchers::FailMatchers
end
