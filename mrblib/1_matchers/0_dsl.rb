module MSpec
  module Matchers
    module DSL
      MISING_PREFIXES = []

      def self.define(name, klass=nil, &definition)
        klass ||= Builder.build(&definition)

        define_method name do |*expected|
          klass.new(*expected)
        end
      end

      def self.define_missing(prefix, klass=nil, &definition)
        klass ||= Builder.build(&definition)

        MISING_PREFIXES << [prefix,klass]
      end

      def method_missing(method,*args,&block)

        MISING_PREFIXES.each do |prefix,klass|
          if method.to_s[0,prefix.length] == prefix
            return klass.new(method,*args,&block)
          end
        end

        super
      end
    end
  end
end

