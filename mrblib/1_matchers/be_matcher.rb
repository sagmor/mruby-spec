module MSpec
  module Matchers
    class BeMatcher < BaseMatcher

      def match(actual)
        actual.equal? expected
      end

      def description
        "be #{expected.inspect}"
      end
    end

    define :be, BeMatcher
  end
end
