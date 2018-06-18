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
    number
  end

  def statement
    statement = log.map do |transaction|
      statement_row(transaction)
    end

    statement.push("credit || debit || balance")

    statement.reverse.join("\n")
  end

  private

  def statement_row(transaction)
    if transaction.transaction_type == 'deposit'
      @balance += transaction.amount
      "#{transaction.amount} || || #{@balance}"
    elsif transaction.transaction_type == 'withdraw'
      @balance -= transaction.amount
      "|| #{transaction.amount} || #{@balance}"
    end
  end
end
