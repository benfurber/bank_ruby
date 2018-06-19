require 'statement'

describe Statement do
  context '@log' do
    it 'when empty, a message is provided' do
      statement = Statement.new
      expect(statement.print).to eq "No transactions to print"
    end
  end
end
