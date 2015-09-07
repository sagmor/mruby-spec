mspec_runner_executed = false

describe MSpec::Runner do
  it "executes examples like this one" do
    expect(mspec_runner_executed).to be_false
    mspec_runner_executed = false
  end
end

# Normal MRuby test assertion to ensure specs were executed
assert('MSpec::Runner executes examples') do
  # mspec_runner_executed was set true on the example above
  assert_true(mspec_runner_executed)
end

