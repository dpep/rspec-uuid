module RSpecUUID
  module Matchers
    class UUIDMatcher
      def matches?(obj)
        return false unless obj.is_a?(String)

        # https://www.uuidtools.com/what-is-uuid
        obj.match? /^\h{8}-\h{4}-\h{4}-\h{4}-\h{12}$/
      end

      def description
        "be a UUID"
      end

      def failure_message
        "expected a UUID"
      end

      def failure_message_when_negated
        "did not expect a UUID"
      end
    end

    def be_a_uuid
      UUIDMatcher.new
    end
  end
end
