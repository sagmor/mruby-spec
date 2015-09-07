module MSpec
  module Matchers
    class EqMatcher < BaseMatcher

      def match(actual)
        actual == expected
      end

      def description
        "eq #{expected.inspect}"
      end
    end

    define :eq, EqMatcher
    define :eql, EqMatcher
  end
end
