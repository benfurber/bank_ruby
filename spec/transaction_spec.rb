require 'transaction'

describe 'Transaction' do
  subject { Transaction }

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
    it 'stores the amount when given a positive integer' do
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

  context '@date' do
    it 'stores the date when provided' do
      date = "14/01/2012"
      transaction = subject.new('deposit', 300, date)

      expect(transaction.date).to eq date
    end

    it "stores today's date when no date is provided" do
      fake_todays_date = Time.new(2018, 06, 17)
      allow(Time).to receive(:now).and_return(fake_todays_date)

      transaction = subject.new('deposit', 300)

      expect(transaction.date).to eq fake_todays_date.strftime("%d/%m/%Y")
    end

    it "throws an error if not provided as dd/mm/yyyy" do
      expect {
        subject.new('deposit', 300, '5/02/2011')
      }.to raise_error(RuntimeError, 'Date must be in dd/mm/yyyy format as a string')
    end
  end
end
