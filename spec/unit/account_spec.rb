require 'account'

describe Account do
  subject { Account.new(transaction_class_double) }

  let(:transaction_class_double) { double 'Transaction', new: transaction }
  let(:transaction) { double 'TransactionInstance' }

  context '#initalize' do
    it 'balance is zero' do
      expect(subject.balance).to eq 0
    end

    it 'log is empty' do
      expect(subject.log).to be_empty
    end
  end

  context 'Transactions' do

    it '#deposit adds to the log' do
      subject.deposit(50)

      expect(subject.log).to include(transaction)
    end

    it '#withdraw adds to the log' do
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
