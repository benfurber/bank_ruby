require 'account'

describe Account do
  subject { Account.new }

  context '#initalize' do
    it 'balance is zero' do
      expect(subject.balance).to eq 0
    end
  end
end
