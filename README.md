# GetEnv

Trivial gem which handles reading from environment variables and coerces the values into integers, floats or True or False. `GetEnv` implements `#[]` and `#fetch` mimicking `Hash`'s behaviour.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'get_env'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install get_env

## Usage

```ruby
GetEnv['YOUR_ENV_VARIABLE']
GetEnv.fetch('YOUR_ENV_VARIABLE') # Will raise a KeyError
```

## Development

After checking out the repo run `rake spec` to run the tests.

Releasing is handled by the CI based on git tags. Once your changes are merged into `master` branch (make sure you've bumped the `VERSION` in `version.rb` file) run `rake release:source_control_push` to release.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rainforestapp/get_env. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GetEnv project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rainforestapp/get_env/blob/master/CODE_OF_CONDUCT.md).
