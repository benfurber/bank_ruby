# Transaction class created by Account
class Transaction
  attr_reader :transaction_type, :amount, :date

  TRANSACTION_TYPES = [:deposit, :withdraw]

  def initialize(transaction_type, amount, date = add_date_now)
    @transaction_type = transaction_type if valid_transaction?(transaction_type)
    @amount = amount if valid_amount?(amount)
    @date = date if valid_date?(date)
  end

  private

  def add_date_now
    date = Time.now
    return date.strftime("%d/%m/%Y")
  end

  def valid_transaction?(transaction_type)
    find_transaction = TRANSACTION_TYPES.include?(transaction_type)
    raise 'Not a legal transaction type' unless find_transaction
    true
  end

  def valid_amount?(amount)
    raise 'Not a number' unless amount.is_a? Numeric
    raise 'Not a positive number' unless amount > 0
    true
  end

  def valid_date?(date)
    unless date =~ /[0-9]{2}\/[0-9]{2}\/[0-9]{4}/
      # This only checks that the string is two numbers, slash, two
      # numbers, slash four numbers. I could have used the full (leap year
      # compliant) version but I would have just been cutting and pasting.
      raise 'Date must be in dd/mm/yyyy format as a string'
    end
    true
  end
end
