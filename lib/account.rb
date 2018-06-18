require_relative 'transaction'

# Main Account class a user sets up
class Account
  attr_reader :balance, :log

  def initialize
    @balance = 0
    @log = []
  end

  def deposit(number)
    deposit = Transaction.new('deposit', number)
    @log.push(deposit)
  end

  def withdraw(number)
    withdraw = Transaction.new('withdraw', number)
    @log.push(withdraw)
  end
end
