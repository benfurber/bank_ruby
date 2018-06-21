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
    row = prepare_row(transaction)
    recalculate_balance(row)
    print_row(row)
  end

  def prepare_row(transaction)
    row = { date: transaction.date, deposit: 0, withdraw: 0 }
    row[transaction.transaction_type] = transaction.amount
    row
  end

  def recalculate_balance(row)
    @balance += (row[:deposit] - row[:withdraw])
  end

  def print_row(row)
    deposit = format_number(row[:deposit])
    withdraw = format_number(row[:withdraw])
    "#{row[:date]} ||#{deposit} ||#{withdraw} ||#{format_number(@balance)}"
  end

  def print_log(statement)
    statement.push("date || credit || debit || balance")
    statement.reverse.join("\n")
  end

  def format_number(number)
    number != 0 ? " #{sprintf("%.2f", number.to_f)}" : ""
  end
end
