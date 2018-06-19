require 'account'

describe Account do
  context '#initalize' do
    it 'balance is zero' do
      expect(subject.balance).to eq 0
    end

    it 'log is empty' do
      expect(subject.log).to be_empty
    end
  end

  context 'Transactions' do
    before(:each) do
      @transaction = double("Transaction")
      allow(Transaction).to receive(:new).and_return(@transaction)
    end

    it '#deposit adds to the log' do
      subject.deposit(50)

      expect(subject.log).to include(@transaction)
    end

    it '#withdraw adds to the log' do
      subject.withdraw(50)

      expect(subject.log).to include(@transaction)
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
