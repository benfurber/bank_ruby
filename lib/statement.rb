# Called by Account by a statement is requested
class Statement
  def initialize(log = nil)
    @log = [log]
  end

  def print
    if @log.empty?
      return 'No transactions to print'
    end
  end
end
