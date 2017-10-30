
class Oystercard

  attr_accessor :balance

  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90

  def initialize (balance = DEFAULT_BALANCE)
   @balance = balance
  end

  def top_up(value)
    raise 'Oystercard limit' if @balance + value > DEFAULT_LIMIT
    @balance = @balance + value
  end

end
