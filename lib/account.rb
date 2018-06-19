require_relative 'transaction'

# Main Account class a user sets up
class Account
  attr_reader :balance, :log

  def initialize
    @balance = 0
    @log = []
  end

  def deposit(number, date = nil)
    deposit = Transaction.new('deposit', number, date)
    @log.push(deposit)
    "#{number} deposited into account"
  end

  def withdraw(number, date = nil)
    withdraw = Transaction.new('withdraw', number, date)
    @log.push(withdraw)
    "#{number} withdrawn from account"
  end

  def statement
    statement = log.map do |transaction|
      statement_row(transaction)
    end

    statement.push("date || credit || debit || balance")

    statement.reverse.join("\n")
  end

  private

  def statement_row(transaction)
    amount = add_decimals(transaction.amount)
    if transaction.transaction_type == 'deposit'
      @balance += transaction.amount
      "#{transaction.date} || #{amount} || || #{add_decimals(@balance)}"
    elsif transaction.transaction_type == 'withdraw'
      @balance -= transaction.amount
      "#{transaction.date} || || #{amount} || #{add_decimals(@balance)}"
    end
  end

  def add_decimals(number)
    sprintf("%.2f", number.to_f)
  end
end
