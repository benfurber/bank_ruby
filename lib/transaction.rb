# Transaction class created by Account
class Transaction
  attr_reader :transaction_type, :amount, :date

  TRANSACTION_TYPES = ['deposit', 'withdraw']

  def initialize(transaction_type, amount, date = nil)
    @transaction_type = legal_transaction(transaction_type)
    @amount = legal_amount(amount)
    @date = legal_date(date)
  end

  private

  def legal_transaction(transaction_type)
    unless TRANSACTION_TYPES.include?(transaction_type)
      raise 'Not a legal transaction type'
    end

    transaction_type
  end

  def legal_amount(amount)
    raise 'Not a number' unless amount.is_a? Numeric
    raise 'Not a positive number' unless amount > 0

    amount
  end

  def legal_date(date)
    if date.nil?
      date = Time.now
      return date.strftime("%d/%m/%Y")
    end

    unless date =~ /[0-9]{2}\/[0-9]{2}\/[0-9]{4}/
      # Yes, this only checks that the string is two numbers, slash, two
      # numbers, slash four numbers. I could have used the full (leap year
      # compliant) version but I would have just been cutting and pasting off
      # the internet.
      raise 'Date must be in dd/mm/yyyy format as a string'
    end

    date
  end
end
