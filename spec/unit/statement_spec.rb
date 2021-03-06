require 'statement'

describe Statement do
  let(:deposit_date) { '10/01/2012' }
  let(:deposit_amount) { 75 }
  let(:deposit_transaction) {
    double('Transaction',
      :values => { deposit: deposit_amount, withdraw: 0 },
      :date => deposit_date
    )
  }

  let(:withdrawal_date) { '10/01/2012' }
  let(:withdrawal_amount) { 75 }
  let(:withdrawal_transaction) {
    double('Transaction',
      :values => { deposit: 0, withdraw: withdrawal_amount },
      :date => withdrawal_date
    )
  }

  describe '@log' do
    it 'is nil when no log is provided or an empty array' do
      statement = Statement.new
      expect(statement.log).to eq nil
    end

    it 'is an array of Transactions when a log is provided' do
      statement = Statement.new([deposit_transaction])
      expect(statement.log.last).to eq deposit_transaction
    end
  end

  describe '#print when empty' do
    it 'a message saying so is provided' do
      statement = Statement.new
      expect(statement.print).to eq "No transactions to print"
    end
  end

  describe '#print deposit' do
    it 'prints the statement header' do
      statement = Statement.new([deposit_transaction])
      expect(statement.print).to include 'date || credit || debit || balance'
    end

    it 'prints details of each deposit' do
      statement = Statement.new([deposit_transaction])
      expect(statement.print).to include "#{deposit_date} || #{deposit_amount}.00 || || #{deposit_amount}.00"
    end
  end

  describe '#print withdrawal' do
    it 'prints details of each withdrawal' do
      statement = Statement.new([withdrawal_transaction])
      expect(statement.print).to include "#{withdrawal_date} || || #{withdrawal_amount}.00 || -#{withdrawal_amount}.00"
    end
  end
end
