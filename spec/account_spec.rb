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
    it 'adds an item to the log' do
      expect {
        subject.deposit
      }.to change {
        subject.log.length
      }.by 1
    end
  end

  context '#withdraw' do
    it 'adds an item to the log' do
      expect {
        subject.withdraw
      }.to change {
        subject.log.length
      }.by 1
    end
  end
end
