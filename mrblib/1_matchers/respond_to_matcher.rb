module MSpec
  module Matchers
    class RespondToMatcher < BaseMatcher

      def match(actual)
        actual.respond_to? expected
      end

      def description
        "respond to #{expected}"
      end
    end

    define :respond_to, RespondToMatcher
  end
end
