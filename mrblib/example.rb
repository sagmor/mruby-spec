module MSpec
  class Example
    def initialize(group,description,&block)
      @group = group
      @description = description
      @block = block
    end

    # Executes the example Proc
    def execute
      instance_eval(&@block)
    end

    # The example full description
    def description
      [@group.description,@description].join(' ')
    end

    def expect(object)
      Expectation.new(object)
    end

  end
end
