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
    it 'prints the statement' do
      printed_log = 'Statement printed'
      statement = double('Statement', :print => printed_log)
      allow(Statement).to receive(:new).and_return(statement)

      expect(subject.statement).to include printed_log
    end
  end
end
