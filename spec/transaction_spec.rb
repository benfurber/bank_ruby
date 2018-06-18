require 'transaction'

describe 'Transaction' do
  subject { Transaction }

  context '#initialize' do
    context '@transaction_type' do
      it 'stores the transaction type when a deposit' do
        transaction_type = 'deposit'
        transaction = subject.new(transaction_type, 10)

        expect(transaction.transaction_type).to eq transaction_type
      end

      it 'stores the transaction type when a withdrawal' do
        transaction_type = 'withdraw'
        transaction = subject.new(transaction_type, 10)

        expect(transaction.transaction_type).to eq transaction_type
      end

      it 'throws an error when transaction type not deposit/withdrawal' do
        transaction_type = 'random'

        expect {
          subject.new(transaction_type, 10)
        }.to raise_error(RuntimeError, 'Not a legal transaction type')
      end
    end
    
    context '@amount' do
      it 'adds the amount when given a positive integer' do
        amount = 50
        transaction = subject.new('deposit', amount)

        expect(transaction.amount).to eq amount
      end

      it 'throws an error when not given an integer' do
        amount = 'abc'

        expect {
          subject.new('deposit', amount)
        }.to raise_error(RuntimeError, 'Not an integer')
      end

      it 'throws an error when given a negative integer' do
        amount = -5

        expect {
          subject.new('deposit', amount)
        }.to raise_error(RuntimeError, 'Not a positive integer')
      end
    end
  end
end
