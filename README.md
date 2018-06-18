# Bank

A dummy tech test built in Ruby.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

1. [Ruby is installed](https://www.ruby-lang.org/en/documentation/installation/)
2. [RubyGems is installed](https://rubygems.org/pages/download)
3. Bundler is installed:
```
gem install bundler
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
git clone https://github.com/benfurber/bank_ruby
cd bank_ruby
bundle install
```

End with an example of getting some data out of the system or using it for a little demo

## Run the tests
```
rspec
```

## To run

Once cloned and in the root directory run:
```
irb -r ./lib/account.rb
```

Set-up a bank account:
```ruby
> account = Account.new
```

In IRB, make a deposit:
```ruby
> account.deposit(amount, date)
```

## Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Bundle](https://bundler.io/) - Dependency Management
* [RSpec](http://rspec.info/) - Testing framework
* [SimpleCov](https://github.com/colszowka/simplecov) - Test coverage
* [RuboCop](https://github.com/rubocop-hq/rubocop) - Guidelines enforcer(!)

## Contributing

This is just a dummy tech test I was doing so I really shouldn't accept any contributes, sorry.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* To my fearless coach for this project, Eddie
