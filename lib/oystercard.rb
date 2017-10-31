
class Oystercard

attr_accessor :balance

DEFAULT_BALANCE = 0

  def initialize (balance = DEFAULT_BALANCE)
   @balance = balance
  end

  def top_up(value)
    raise 'Oystercard has reached the limit' if exceed?(value)
    @balance += value
  end

  private

  def exceed?(value)
    @balance + value > 90
  end

end
