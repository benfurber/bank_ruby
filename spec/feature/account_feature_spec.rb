require 'account'

describe Account do
  it 'prints details of deposits and withdraws in the right order' do
    account = Account.new
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    account.log
    output = "date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
    expect(account.statement).to eq output
  end
end
