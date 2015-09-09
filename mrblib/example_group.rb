module MSpec
  class ExampleGroup
    attr_reader :target

    def initialize(target,parent=nil,&block)
      @target = target
      @parent = parent || NullExampleGroup.new
      @groups = []
      @examples = []
      instance_eval(&block)
    end

    # Attach a new sub example group
    def describe(target,&block)
      @groups << ExampleGroup.new(target,self,&block)
    end

    # Attach a new example to the subgroup
    def it(description,&block)
      @examples << Example.new(self,description,&block)
    end

    def description
      description = if @target.kind_of?(String)
        " "+@target
      else
        @target.to_s
      end

      [@parent.description,description].join('')
    end

    # Gets all the group examples (including subgroups)
    def examples
      @groups.inject(@examples){ |examples,group| examples + group.examples }
    end

    def local_described_class
      @target if @target.kind_of? Class
    end

    def described_class
      local_described_class || @parent.described_class
    end

    def subject(&block)
      if block
        @subject = block
      elsif @subject
        @subject
      elsif local_described_class
        Proc.new{ local_described_class.new }
      else
        @parent.subject
      end
    end
  end
end
