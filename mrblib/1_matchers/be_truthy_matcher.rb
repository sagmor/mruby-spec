module MSpec
  module Matchers
    class BeTruthyMatcher < BaseMatcher

      def match(actual)
        !!actual
      end

      def description
        "be truthy"
      end
    end

    define :be_truthy, BeTruthyMatcher
  end
end

