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

    it 'pretty prints the statement header' do
      expect(subject.statement).to include 'credit || debit || balance'
    end

    it 'pretty prints details of each transaction in log' do
      subject.deposit(1000)
      expect(subject.statement).to include '1000 ||'
    end

    it 'pretty prints details of each transaction in log' do
      subject.withdraw(500)
      expect(subject.statement).to include '|| 500'
    end
  end
end
