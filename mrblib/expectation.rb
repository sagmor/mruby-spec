module MSpec

  class Expectation
    def initialize(object)
      @object = object
    end

    # Executes the given matcher
    #
    #   expect(object).to be_something
    def to(matcher)
      matcher.match(@object)
    end
  end
end
