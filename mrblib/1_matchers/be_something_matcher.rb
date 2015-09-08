module MSpec
  module Matchers
    class BeSomethingMatcher < BaseMatcher

      def initialize(method,*args,&block)
        @method = method.to_s
        @args = args
        @block = block
      end

      def match(actual)
        actual.send method, *@args, &@block
      end

      def method
        @method[3,@method.length-3]+'?'
      end
    end

    DSL.define_missing "be_", BeSomethingMatcher
  end
end
