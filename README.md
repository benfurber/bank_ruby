# Bank

A dummy tech test built in Ruby.

## Task

The task was to build a simple bank that users would access via a REPL. Users must be able to make deposits and withdrawals as well as print account statements that show each transaction with the date, amount and balance.

I started by drafting the requirements into [user stories with individual acceptance criteria](https://github.com/benfurber/bank_ruby/blob/master/docs/user_stories.md) and used those stories to draft a [basic representation of how I saw those stories working as a set of classes, methods and states](https://github.com/benfurber/bank_ruby/blob/master/docs/bank-diagram.png).

I followed standard TDD principles for this project by drafting tests in RSpec before coding my model, keeping an eye on my test coverage by using SimpleCov and regularly running Rubocop to check my grammar.

### Prerequisites

1. [Ruby is installed](https://www.ruby-lang.org/en/documentation/installation/)
2. [RubyGems is installed](https://rubygems.org/pages/download)
3. Bundler is installed:
```
gem install bundler
```

### Installing

```
git clone https://github.com/benfurber/bank_ruby
cd bank_ruby
bundle install
```

## Run the tests
```ruby
rspec
```

## To run

Once cloned and in the root directory run:
```ruby
irb -r ./lib/account.rb
```

In IRB, set-up a bank account:
```ruby
> account = Account.new
```

In IRB, make a deposit:
```ruby
> account.deposit(amount, date)
```

In IRB, make a withdraw:
```ruby
> account.deposit(amount, date)
```

In IRB, print a statement:
```ruby
> account.statement
```

Full example:
```ruby
> account = Account.new
> account.deposit(1000, '10/01/2012')
> account.deposit(2000, '13/01/2012')
> account.withdraw(500, '14/01/2012')
> account.statement
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
