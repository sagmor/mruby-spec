module MSpec
  module Matchers
    class RaiseErrorMatcher < BaseMatcher
      def initialize(expected_error_or_message=nil, expected_message=nil)
          case expected_error_or_message
          when nil
            @expected_error, @expected_message = Exception, expected_message
          when String
            @expected_error, @expected_message = Exception, expected_error_or_message
          else
            @expected_error, @expected_message = expected_error_or_message, expected_message
          end
      end

      def match(block)
        begin
          block.call

          # No exception was raised
          false
        rescue Exception => error
          return false unless error.kind_of? @expected_error
          return false unless @expected_message.nil? || error.message == @expected_message

          true
        end
      end
    end

    define :raise_error, RaiseErrorMatcher
  end
end
