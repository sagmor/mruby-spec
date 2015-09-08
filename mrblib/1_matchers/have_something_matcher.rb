module MSpec
  module Matchers
    class HaveSomethingMatcher < BaseMatcher

      def initialize(method,*args,&block)
        @method = method.to_s
        @args = args
        @block = block
      end

      def match(actual)
        actual.send method, *@args, &@block
      end

      def method
        'has_'+@method[5,@method.length-5]+'?'
      end
    end

    DSL.define_missing "have_", HaveSomethingMatcher
  end
end

