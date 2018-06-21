require 'transaction'

describe 'Transaction' do
  subject { Transaction }

  describe '@values - deposits' do
    it 'stores the amount correctly when a possitive integer deposit' do
      amount = 50
      values = {
        deposit: amount,
        withdraw: 0
      }
      transaction = subject.new(values)
      expect(transaction.values[:deposit]).to eq amount
    end

    it 'stores the amount when given a positive float' do
      amount = 26.50
      values = {
        deposit: amount,
        withdraw: 0
      }
      transaction = subject.new(values)
      expect(transaction.values[:deposit]).to eq amount
    end
  end

  describe '@values - withdrawals' do
    it 'stores the amount correctly when a possitive integer deposit' do
      amount = 50
      values = {
        deposit: 0,
        withdraw: amount
      }
      transaction = subject.new(values)
      expect(transaction.values[:withdraw]).to eq amount
    end
  end

  describe '@date' do
    it 'stores the date when provided' do
      date = "14/01/2012"
      transaction = subject.new({}, date)
      expect(transaction.date).to eq date
    end

    it "stores today's date when no date is provided" do
      fake_todays_date = Time.new(2018, 06, 17)
      allow(Time).to receive(:now).and_return(fake_todays_date)
      transaction = subject.new({})
      expect(transaction.date).to eq fake_todays_date.strftime("%d/%m/%Y")
    end

    it "throws an error if not provided as dd/mm/yyyy" do
      expect {
        subject.new({}, '5/02/2011')
      }.to raise_error(RuntimeError, 'Date must be in dd/mm/yyyy format as a string')
    end
  end
end
