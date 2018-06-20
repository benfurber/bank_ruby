require_relative 'transaction'
require_relative 'statement'

# Main Account class a user sets up
class Account
  attr_reader :balance, :log

  def initialize(transaction_class = Transaction)
    @balance = 0
    @log = []
    @transaction_class = transaction_class
  end

  def deposit(number, date = nil)
    deposit = @transaction_class.new('deposit', number, date)
    log.push(deposit)
    "#{number} deposited into account"
  end

  def withdraw(number, date = nil)
    withdraw = @transaction_class.new('withdraw', number, date)
    log.push(withdraw)
    "#{number} withdrawn from account"
  end

  def statement
    statement = Statement.new(log)
    statement.print
  end
end
