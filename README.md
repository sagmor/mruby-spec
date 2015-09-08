# MRuby Spec

[![Travis](https://img.shields.io/travis/sagmor/mruby-spec.svg)](https://travis-ci.org/sagmor/mruby-spec)

MRuby Spec (or MSpec) is a Behaviour Driven Development framework for MRuby inspired in RSpec.

## Usage

Add `mruby-spec` as a dependency on your MRuby's `build_config.rb`

```ruby
MRuby::Build.new('test') do |conf|
  
  # Your build configuration

  conf.gem github: 'sagmor/mruby-spec'
  conf.enable_test
end
```

Write your tests using BDD syntaxt

```ruby
describe YourClass do
  it "does something" do
    expect(false).to be true
  end
end
```

And watch it fail

```shell
# If you are using mruby-cli
bundle exec mrb test

# or if you are on MRuby's directory
./minirake test
```
