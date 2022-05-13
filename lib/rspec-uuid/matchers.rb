module RSpecUUID
  module Matchers
    class UUIDMatcher
      def initialize(version = nil)
        @version = version
      end

      def matches?(actual)
        return false unless actual.is_a?(String)

        # https://www.uuidtools.com/what-is-uuid
        match = actual.match /^\h{8}-\h{4}-(\h{4})-\h{4}-\h{12}$/

        return false unless match

        if @version
          # 1st nibble of 3rd section
          @actual_version = match[1].to_i(16) >> 12

          @version == @actual_version
        else
          true
        end
      end

      def description
        @version ? "a UUID v#{@version}" : "a UUID"
      end

      def failure_message
        if @actual_version
          "expected #{description}, found a UUID v#{@actual_version}"
        else
          "expected #{description}"
        end
      end

      def failure_message_when_negated
        "did not expect #{description}"
      end
    end

    def be_a_uuid(...)
      UUIDMatcher.new(...)
    end
  end
end
