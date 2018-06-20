require 'statement'

describe Statement do
  let(:deposit_date) { '10/01/2012' }
  let(:deposit_amount) { 75 }
  let(:deposit_transaction) {
    double('Transaction',
      :transaction_type => :deposit,
      :amount => deposit_amount,
      :date => deposit_date,
    )
  }

  let(:withdrawal_date) { '10/01/2012' }
  let(:withdrawal_amount) { 75 }
  let(:withdrawal_transaction) {
    double('Transaction',
      :transaction_type => :withdraw,
      :amount => withdrawal_amount,
      :date => withdrawal_date,
    )
  }

  let(:stub_valid_log) {
    allow_any_instance_of(Statement).to receive(:valid_log?).and_return(true)
  }

  context '@log' do
    before(:each) do
      allow(Transaction).to receive(:new).and_return(deposit_transaction)
    end

    it 'is nil when no log is provided or an empty array' do
      statement = Statement.new
      expect(statement.log).to eq nil
    end

    it 'is an array of Transactions when a log is provided' do
      stub_valid_log
      statement = Statement.new([deposit_transaction])

      expect(statement.log.last).to eq deposit_transaction
    end

    it 'throws an error when not provided an array' do
      expect {
        Statement.new('random string')
      }.to raise_error(RuntimeError, 'Log provided must be an array')
    end

    it 'throws an error when array contains more than instances of Transaction' do
      log = ['random string']
      expect {
        Statement.new(log)
      }.to raise_error(RuntimeError, 'Only instances of Transaction allowed in log')
    end
  end

  context '#print when empty' do
    it 'a message saying so is provided' do
      statement = Statement.new

      expect(statement.print).to eq "No transactions to print"
    end
  end

  context '#print deposit' do
    before(:each) do
      allow(Transaction).to receive(:new).and_return(deposit_transaction)
      stub_valid_log
    end

    it 'prints the statement header' do
      statement = Statement.new([deposit_transaction])
      expect(statement.print).to include 'date || credit || debit || balance'
    end

    it 'prints details of each deposit' do
      statement = Statement.new([deposit_transaction])
      expect(statement.print).to include "#{deposit_date} || #{deposit_amount}.00 || || #{deposit_amount}.00"
    end
  end

  context '#print withdrawal' do
    it 'prints details of each withdrawal' do
      allow(Transaction).to receive(:new).and_return(withdrawal_transaction)
      stub_valid_log
      statement = Statement.new([withdrawal_transaction])
      expect(statement.print).to include "#{withdrawal_date} || || #{withdrawal_amount}.00 || -#{withdrawal_amount}.00"
    end
  end
end
