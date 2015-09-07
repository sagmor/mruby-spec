module MSpec
  module Matchers
    module DSL
      def self.define(name, klass=nil, &definition)
        klass ||= Builder.build(&definition)

        define_method name do |*expected|
          klass.new(*expected)
        end
      end
    end
  end
end

