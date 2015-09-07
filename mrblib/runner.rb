module MSpec

  # Wrapper around MRuby's test framework
  module Runner
    extend self

    module MainMethods
      def describe(target,&block)
        # Create example group
        group = ExampleGroup.new(target,&block)

        # Register all examples
        group.examples.each do |example|
          Runner.register(example)
        end
      end
    end

    def register(example)
      main.assert(example.description) do
        example.execute
      end
    end

    def setup(main)
      @main = main

      @main.extend(MainMethods)

      true
    end

    def main
      @main
    end

  end

end

MSpec::Runner.setup(self)
