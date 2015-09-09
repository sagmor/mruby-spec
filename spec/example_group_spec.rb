describe MSpec::ExampleGroup do
  subject{ described_class.new("test"){} }

  it "allows a subject to be set" do
    subject.subject{ "subject" }
    expect(subject.subject.call).to eq "subject"
  end

  it "has a target" do
    expect(subject.target).to eq "test"
  end
end
