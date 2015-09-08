describe MSpec::Matchers do
  # @see https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
  describe "Built in matchers" do

    describe "Object identity" do
      it '"expect(actual).to be(expected)"' do
        actual = "some string"
        expected = actual
        unexpected = actual.dup

        expect(actual).to be(expected)
        expect(actual).not_to be(unexpected)
      end

    end

    describe "Object equivalence" do
      it '"expect(actual).to eq(expected)"' do # passes if actual == expected
        actual = "some string"
        expected = actual.dup
        unexpected = "some other string"

        expect(actual).to eq(expected)
        expect(actual).not_to eq(unexpected)
      end
    end

    describe "Optional APIs for identity/equivalence" do
      it '"expect(actual).to eql(expected)"' do   # passes if actual.eql?(expected)
        actual = "some string"
        expected = actual.dup
        unexpected = "some other string"

        expect(actual).to eql(expected)
        expect(actual).not_to eql(unexpected)
      end

      it '"expect(actual).to equal(expected)"' do # passes if actual.equal?(expected)
        actual = "some string"
        expected = actual
        unexpected = actual.dup

        expect(actual).to equal(expected)
        expect(actual).not_to equal(unexpected)
      end
    end

    describe "Comparisons" do
      it '"expect(actual).to be > expected"' do
        expect(100).to be > 10
        expect(100).not_to be > 100
        expect(100).not_to be > 1000
      end

      it '"expect(actual).to be >= expected"' do
        expect(100).to be >= 10
        expect(100).to be >= 100
        expect(100).not_to be >= 1000
      end


      it '"expect(actual).to be <= expected"' do
        expect(10).to be <= 100
        expect(10).to be <= 10
        expect(10).not_to be <= 1
      end


      it '"expect(actual).to be < expected"' do
        expect(10).to be < 100
        expect(10).not_to be < 10
        expect(10).not_to be < 1
      end


      it '"expect(actual).to be_between(minimum, maximum).inclusive"'
      it '"expect(actual).to be_between(minimum, maximum).exclusive"'
      it '"expect(actual).to match(/expression/)"'
      it '"expect(actual).to be_within(delta).of(expected)"'
      it '"expect(actual).to start_with expected"'
      it '"expect(actual).to end_with expected"'
    end

    describe "Types/classes/response" do
      it '"expect(actual).to be_instance_of(expected)"' do
        klass = Class.new
        actual = klass.new

        expect(actual).to be_instance_of(klass)
        expect(actual).not_to be_instance_of(Object)
      end

      it '"expect(actual).to be_kind_of(expected)"' do
        klass = Class.new
        actual = klass.new

        expect(actual).to be_kind_of(klass)
        expect(actual).to be_kind_of(Object)
        expect(actual).not_to be_kind_of(String)
      end

      it '"expect(actual).to respond_to(expected)"' do
        klass = Class.new do
          def some_method
          end
        end
        actual = klass.new

        expect(actual).to respond_to :some_method
      end
    end

    describe "Truthiness and existentialism" do
      it '"expect(actual).to be_truthy"' do    # passes if actual is truthy (not nil or false)
        expect(true).to be_truthy
        expect("true").to be_truthy
        expect("").to be_truthy
        expect(0).to be_truthy

        expect(false).not_to be_truthy
        expect(nil).not_to be_truthy
      end

      it '"expect(actual).to be true"' do     # passes if actual == true
        expect(true).to be true
        expect(false).not_to be true
        expect(nil).not_to be true
        expect("true").not_to be true
      end

      it '"expect(actual).to be_falsey"' do    # passes if actual is falsy (nil or false)
        expect(false).to be_falsey
        expect(nil).to be_falsey

        expect(true).not_to be_falsey
        expect("false").not_to be_falsey
        expect("").not_to be_falsey
        expect(0).not_to be_falsey
      end

      it '"expect(actual).to be false"' do     # passes if actual == false
        expect(false).to be false
        expect(true).not_to be false
        expect(nil).not_to be false
        expect("false").not_to be false
      end

      it '"expect(actual).to be_nil"' do       # passes if actual is nil
        expect(nil).to be_nil
        expect("").not_to be_nil
      end

      it '"expect(actual).to exist"'        # passes if actual.exist? and/or actual.exists? are truthy
      it '"expect(actual).to exist(*args)"' # passes if actual.exist?(*args) and/or actual.exists?(*args) are truthy
    end

    describe "Expecting errors" do
      it '"expect { ... }.to raise_error"' do
        expect{ raise RuntimeError }.to raise_error
        expect{ 'some safe code' }.not_to raise_error
      end

      it '"expect { ... }.to raise_error(ErrorClass)"' do
        error = Class.new(RuntimeError)

        expect{ raise error }.to raise_error(error)
        expect{ raise error }.to raise_error(RuntimeError)
      end

      it '"expect { ... }.to raise_error("message")"' do
        expect{ raise "message" }.to raise_error("message")
      end

      it '"expect { ... }.to raise_error(ErrorClass, "message")"' do
        error = Class.new(RuntimeError)
        expect{ raise error, "message" }.to raise_error(error, "message")
      end
    end

    describe "Expecting throws" do
      it "expect { ... }.to throw_symbol"
      it "expect { ... }.to throw_symbol(:symbol)"
      it "expect { ... }.to throw_symbol(:symbol, 'value')"
    end

    describe "Predicate matchers" do
      it "expect(actual).to be_xxx" do         # passes if actual.xxx?
        actual = Class.new do
          def something_useful?
            false
          end

          def test_object?
            true
          end
        end.new

        expect(actual).to be_test_object
        expect(actual).not_to be_something_useful
      end

      it "expect(actual).to have_xxx(:arg)" do # passes if actual.has_xxx?(:arg)
        actual = Class.new do
          def has_some_useful_functionality?
            false
          end

          def has_test_functionality?
            true
          end
        end.new

        expect(actual).to have_test_functionality
        expect(actual).not_to have_some_useful_functionality
      end
    end

    describe "Collection membership" do
      it "expect(actual).to include(expected)"
      it "expect(array).to match_array(expected_array)"
      # ...which is the same as:
      it "expect(array).to contain_exactly(individual, elements)"
    end

    describe "Ranges" do
      it "expect(1..10).to cover(3)"
    end

    describe "Change observation" do
      it "expect { object.action }.to change(object, :value).from(old).to(new)"
      it "expect { object.action }.to change(object, :value).by(delta)"
      it "expect { object.action }.to change(object, :value).by_at_least(minimum_delta)"
      it "expect { object.action }.to change(object, :value).by_at_most(maximum_delta)"
    end

    describe "Satisfy" do
      it "expect(actual).to satisfy { |value| value == expected }"
    end

    describe "Output capture" do
      it 'expect { actual }.to output("some output").to_stdout'
      it 'expect { actual }.to output("some error").to_stderr'
    end

    describe "Block expectation" do
      it "expect { |b| object.action(&b) }.to yield_control"
      it "expect { |b| object.action(&b) }.to yield_with_no_args"           # only matches no args
      it "expect { |b| object.action(&b) }.to yield_with_args"              # matches any args
      it "expect { |b| object.action(&b) }.to yield_successive_args(*args)" # matches args against multiple yields
    end
  end
end
