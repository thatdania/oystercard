
class Oystercard

attr_accessor :balance

DEFAULT_BALANCE = 0

  def initialize (balance = DEFAULT_BALANCE)
   @balance = balance
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    @balance += amount
  end

  def deduct(cost)
    @balance -= cost
  end

  def in_journey?
    false
  end

  private

  def exceed?(value)
    @balance + value > 90
  end

end
