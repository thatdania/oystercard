
class Oystercard

attr_reader :balance, :in_journey

DEFAULT_BALANCE = 0

  def initialize (balance = DEFAULT_BALANCE)
   @balance = balance
   @in_journey = in_journey?
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    @balance += amount
  end

  def deduct(cost)
    @balance -= cost
  end

  def touch_in
    in_journey?(true)
  end

  def touch_out
    in_journey?(false)
  end

  private

  def exceed?(value)
    @balance + value > 90
  end

  def in_journey?(status = false)
    @in_journey = status
  end

end
