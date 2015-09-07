module MSpec
  module Matchers
    UndefinedValue = Module.new

    # @abstract
    class BaseMatcher
      def initialize(expected = UndefinedValue)
        @expected = expected
      end

      def expected
        @expected
      end

      def description
        nil
      end

      def diff(actual)
        "    Expected: #{expected.inspect}\n" +
        "      Actual: #{actual.inspect}"
      end
    end
  end
end
