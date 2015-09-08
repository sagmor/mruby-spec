module MSpec
  class Example
    include MSpec::Matchers::DSL

    PENDING = -> { raise MRubyTestSkip, "(Not implemented)" }
    def initialize(group,description,&block)
      @group = group
      @description = description
      @block = block || PENDING
    end

    # Executes the example Proc
    def execute
      instance_eval(&@block)
    end

    # The example full description
    def description
      [@group.description,@description].join(' ')
    end

    def expect(*args,&block)
      Expectation.new(*args,&block)
    end

  end
end
