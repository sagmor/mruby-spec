module MSpec
  class ExampleGroup
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
  end
end
