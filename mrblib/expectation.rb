module MSpec

  class Expectation
    Positive = 'Expected to'
    Negative = 'Not expected to'

    def initialize(value=nil,&block)
      @actual = block || value
    end

    def actual
      @actual
    end

    # Executes the given matcher
    #
    #   expect(object).to be_something
    def to(matcher)
      unless matcher.match(actual)
        fail!(Positive, matcher)
      else
        succeed!
      end
    end

    def not_to(matcher)
      if matcher.match(actual)
        fail!(Negative, matcher)
      else
        succeed!
      end
    end

    private
      def assert!(success,*args)
        Runner.main.assert_true(success, *args)
      end

      def succeed!
        assert! true
      end

      def fail!(type, matcher)
        assert! false, [type,matcher.description].join(' '), matcher.diff(actual)
      end
  end
end
