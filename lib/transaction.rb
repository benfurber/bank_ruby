# Transaction class created by Account
class Transaction
  attr_reader :transaction_type, :amount

  TRANSACTION_TYPES = ['deposit', 'withdraw']

  def initialize(transaction_type, amount)
    @transaction_type = legal_transaction(transaction_type)
    @amount = legal_amount(amount)
  end

  private

  def legal_transaction(transaction_type)
    unless TRANSACTION_TYPES.include?(transaction_type)
      raise 'Not a legal transaction type'
    end

    transaction_type
  end

  def legal_amount(amount)
    raise 'Not an integer' unless amount.is_a? Integer
    raise 'Not a positive integer' unless amount > 0
    
    amount
  end
end
