# Transaction class created by Account
class Transaction
  attr_reader :values, :date

  def initialize(values, date = add_date_now)
    @values = values
    @date = date if valid_date?(date)
  end

  private

  def add_date_now
    date = Time.now
    return date.strftime("%d/%m/%Y")
  end

  def valid_date?(date)
    unless date =~ /[0-9]{2}\/[0-9]{2}\/[0-9]{4}/
      # This only checks that the string is two numbers, slash, two
      # numbers, slash four numbers. I could have used the full (leap year
      # compliant) version but I would have just been cutting and pasting.
      raise 'Date must be in dd/mm/yyyy format as a string'
    end
    true
  end
end
