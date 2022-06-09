require "rspec/expectations"

RSpec::Matchers.define :be_a_uuid do |version: nil|
  chain :of_version do |version|
    @version = version
  end

  match do |actual|
    raise ArgumentError if @version && version

    return false unless actual.is_a?(String)

    # https://www.uuidtools.com/what-is-uuid
    matches = actual.match /^\h{8}-\h{4}-(\h{4})-\h{4}-\h{12}$/
    return false unless matches

    version ||= @version
    if version
      # 1st nibble of 3rd section
      @actual_version = matches[1].to_i(16) >> 12

      version == @actual_version
    else
      true
    end
  end

  description do
    version ? "a UUID v#{version}" : "a UUID"
  end

  failure_message do
    if @actual_version
      "expected #{description}, found a UUID v#{@actual_version}"
    else
      "expected #{description}"
    end
  end

  failure_message_when_negated do
    "did not expect #{description}"
  end
end

RSpec::Matchers.alias_matcher :a_uuid, :be_a_uuid
