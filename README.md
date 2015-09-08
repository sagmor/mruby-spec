# MRuby Spec

[![Travis](https://img.shields.io/travis/sagmor/mruby-spec.svg)](https://travis-ci.org/sagmor/mruby-spec)
[![Inline docs](http://inch-ci.org/github/sagmor/mruby-spec.svg?branch=master&style=shields)](http://inch-ci.org/github/sagmor/mruby-spec)

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

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/<%= name %>. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
