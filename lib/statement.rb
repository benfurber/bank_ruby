# Called by Account by a statement is requested
class Statement
  attr_reader :log

  def initialize(log = nil)
    @log = log
    @balance = 0
  end

  def print
    return 'No transactions to print' if log.nil?
    statement = build_log(log)
    print_log(statement)
  end

  private

  def build_log(log)
    log.map { |transaction| create_statement_row(transaction) }
  end

  def create_statement_row(transaction)
    recalculate_balance(transaction)
    print_row(transaction)
  end

  def recalculate_balance(transaction)
    @balance += (transaction.values[:deposit] - transaction.values[:withdraw])
  end

  def print_row(transaction)
    date = transaction.date
    deposit = format_number(transaction.values[:deposit])
    withdraw = format_number(transaction.values[:withdraw])
    "#{date} ||#{deposit} ||#{withdraw} ||#{format_number(@balance)}"
  end

  def print_log(statement)
    statement.push("date || credit || debit || balance")
    statement.reverse.join("\n")
  end

  def format_number(number)
    number != 0 ? " #{sprintf("%.2f", number.to_f)}" : ""
  end
end
