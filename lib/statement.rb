# Called by Account by a statement is requested
class Statement
  attr_reader :log

  def initialize(log = nil)
    @log = log if valid_log?(log)
  end

  def print
    if log.nil?
      return 'No transactions to print'
    end

    @balance = 0

    statement = log.map do |transaction|
      statement_row(transaction)
    end

    statement.push("date || credit || debit || balance")

    statement.reverse.join("\n")

  end

  private

  def valid_log?(log)
    return true if (log.nil? || log.empty?)

    raise 'Log provided must be an array' unless log.kind_of? Array

    unless log.all? { |item| item.kind_of? Transaction }
      raise 'Only instances of Transaction allowed within log array'
    end
    
    true
  end

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
