describe MSpec::Example do
  describe "#subject" do
    subject { "subject" }

    it "has access to the subject" do
      should eq "subject"
    end

    it "is memoized" do
      expect(subject).to be subject
      expect(subject).not_to be "subject"
    end
  end

  describe "#described_class" do
    it "is available" do
      expect(described_class).to be MSpec::Example
    end

    describe(String) do

      it "the subject is an instance of the class" do
        is_expected.to eq ""
        expect(subject).to be_instance_of String
      end

    end
  end
end
