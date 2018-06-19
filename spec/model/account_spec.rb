require 'account'

describe Account do
  subject { Account.new }

  context '#initalize' do
    it 'balance is zero' do
      expect(subject.balance).to eq 0
    end

    it 'log is empty' do
      expect(subject.log).to be_empty
    end
  end

  context '#deposit' do
    it 'adds a Transaction to the log' do
      transaction = double("Transaction")
      allow(Transaction).to receive(:new).and_return(transaction)

      subject.deposit(50)

      expect(subject.log).to include(transaction)
    end
  end

  context '#withdraw' do
    it 'adds an item to the log' do
      transaction = double("Transaction")
      allow(Transaction).to receive(:new).and_return(transaction)

      subject.withdraw(50)

      expect(subject.log).to include(transaction)
    end
  end

  context '#statement' do
    it 'prints the statement header' do
      expect(subject.statement).to include 'credit || debit || balance'
    end

    it 'prints details of each deposit' do
      amount = 1000
      date = '10/10/2017'
      transaction = double(
        "Transaction",
        :transaction_type => 'deposit',
        :amount => amount,
        :date => date,
      )
      allow(Transaction).to receive(:new).and_return(transaction)

      subject.deposit(amount)
      expect(subject.statement).to include "#{date} || #{amount}.00 || || #{amount}.00"
    end

    it 'prints details of each withdraw' do
      amount = 500
      date = '10/10/2017'
      transaction = double(
        "Transaction",
        :transaction_type => 'withdraw',
        :amount => amount,
        :date => date,
      )
      allow(Transaction).to receive(:new).and_return(transaction)
      allow(transaction).to receive(:amount).and_return(amount)

      subject.withdraw(amount)
      expect(subject.statement).to include "#{date} || || #{amount}.00 || -#{amount}.00"
    end
  end
end
