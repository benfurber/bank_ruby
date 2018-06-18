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
    raise RuntimeError unless TRANSACTION_TYPES.include?(transaction_type)
    transaction_type
  end

  def legal_amount(amount)
    raise RuntimeError unless amount.is_a? Integer
    raise RuntimeError unless amount > 0
    amount
  end
end
