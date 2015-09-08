module MSpec
  module Matchers
    class BeFalseyMatcher < BaseMatcher

      def match(actual)
        !actual
      end

      def description
        "be falsey"
      end
    end

    define :be_falsey, BeFalseyMatcher
  end
end
