# Main Account class a user sets up
class Account
  attr_reader :balance, :log

  def initialize
    @balance = 0
    @log = []
  end

  def deposit
    @log.push('deposit')
  end

  def withdraw
    @log.push('withdraw')
  end
end
