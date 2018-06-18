require 'account'

describe Account do
  subject { Account.new }

  let(:transaction) { double("Transaction") }

  before (:each) do
    allow(Transaction).to receive(:new).and_return(transaction)
  end

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
      subject.deposit(50)

      expect(subject.log).to include(transaction)
    end
  end

  context '#withdraw' do
    it 'adds an item to the log' do
      subject.withdraw(50)

      expect(subject.log).to include(transaction)
    end
  end
end
