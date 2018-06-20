require 'account'

describe Account do
  subject { Account.new(transaction_class_double, statement_class_double) }

  let(:transaction_class_double) { double 'Transaction', new: transaction }
  let(:transaction) { double 'transaction_instance' }

  let(:statement_class_double) { double 'Statement', new: statement }
  let(:statement) { double 'statement_instance', print: statement_print }
  let(:statement_print) { 'Statement printed' }

  context '#initalize' do
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
      expect(subject.statement).to include statement_print
    end
  end
end
