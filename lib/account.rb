require_relative 'transaction'
require_relative 'statement'

# Main Account class a user sets up
class Account
  attr_reader :balance, :log

  def initialize
    @balance = 0
    @log = []
  end

  def deposit(number, date = nil)
    deposit = Transaction.new('deposit', number, date)
    log.push(deposit)
    "#{number} deposited into account"
  end

  def withdraw(number, date = nil)
    withdraw = Transaction.new('withdraw', number, date)
    log.push(withdraw)
    "#{number} withdrawn from account"
  end

  def statement
    statement = Statement.new(log)
    statement.print
  end
end
