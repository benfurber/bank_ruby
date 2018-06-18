require 'account'

describe Account do
  subject { Account.new }

  let(:transaction) { double("Transaction") }

  context '#initalize' do
    it 'balance is zero' do
      expect(subject.balance).to eq 0
    end

    it 'log is empty' do
      expect(subject.log).to be_empty
    end
  end

  context '#deposit' do
    before(:each) do
      allow(Transaction).to receive(:new).and_return(transaction)
    end

    it 'adds a Transaction to the log' do
      subject.deposit(50)

      expect(subject.log).to include(transaction)
    end
  end

  context '#withdraw' do
    before(:each) do
      allow(Transaction).to receive(:new).and_return(transaction)
    end

    it 'adds an item to the log' do
      subject.withdraw(50)

      expect(subject.log).to include(transaction)
    end
  end

  context '#statement' do
    before(:each) do
    end

    it 'prints the statement header' do
      expect(subject.statement).to include 'credit || debit || balance'
    end

    it 'prints details of each deposit' do
      subject.deposit(1000)
      expect(subject.statement).to include '1000.00 || || 1000.00'
    end

    it 'prints details of each withdraw' do
      subject.withdraw(500)
      expect(subject.statement).to include '|| 500.00 || -500.00'
    end
  end
end
