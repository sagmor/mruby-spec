describe MSpec::Example do
  describe "#subject" do
    subject { Object.new }

    it "has access to the subject" do
      expect{
        expect(subject).not_to be_nil
      }.not_to raise_error
    end

    it "is memoized" do
      expect(subject).to be subject
    end
  end

  describe "#described_class" do
    it "is available" do
      expect(described_class).to be MSpec::Example
    end

    describe(String) do

      it "the subject is an instance of the class" do
        expect(subject).to eq ""
        expect(subject).to be_instance_of String
      end

    end
  end
end
