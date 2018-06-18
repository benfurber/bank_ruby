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
    statement = ["credit || debit || balance"]
    log.reverse.each { |transaction| statement.push(statement_row(transaction)) }
    statement.join("\n")
  end

  private

  def statement_row(transaction)
    if transaction.transaction_type == 'deposit'
      "#{transaction.amount} ||"
    elsif transaction.transaction_type == 'withdraw'
      "|| #{transaction.amount}"
    end
  end
end
