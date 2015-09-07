module MSpec
  module Matchers

    class CompareMatcher < BaseMatcher

      def initialize(value,operator)
        super(value)
        @operator = operator
      end

      def match(actual)
        actual.send(@operator,expected)
      end

      def description
        "be #{@operator} #{expected.inspect}"
      end

    end

  end
end
