module MSpec
  module Matchers
    class BeMatcher < BaseMatcher

      def match(actual)
        actual.equal? expected
      end

      def description
        "be #{expected.inspect}"
      end

      %w{ > >= < <= }.each do |operator|
        define_method operator do |value|
          CompareMatcher.new(value,operator)
        end
      end
    end

    define :be, BeMatcher
    define :equal, BeMatcher
  end
end
