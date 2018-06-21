# Called by Account by a statement is requested
class Statement
  attr_reader :log

  def initialize(log = nil)
    @log = log if valid_log?(log)
    @balance = 0
  end

  def print
    return 'No transactions to print' if log.nil?
    statement = build_log(log)
    print_log(statement)
  end

  private

  def valid_log?(log)
    return true if (log.nil? || log.empty?)
    log_an_array?(log)
    true
  end

  def log_an_array?(log)
    raise 'Log provided must be an array' unless log.kind_of? Array
  end

  def build_log(log)
    log.map do |transaction|
      statement_row(transaction)
    end
  end

  def statement_row(transaction)
    row = prepare_row(transaction)
    @balance += (row[:deposit] - row[:withdraw])
    print_row(row)
  end

  def prepare_row(transaction)
    row = { date: transaction.date, deposit: 0, withdraw: 0 }
    row[transaction.transaction_type] = transaction.amount
    row
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
