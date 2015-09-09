module MSpec

  # Null object to handle example group parents chain
  class NullExampleGroup
    def description
      ""
    end

    def described_class
      nil
    end

    def subject
      Proc.new{
        raise "Subject not defined"
      }
    end
  end

end
