
class Oystercard

attr_reader :balance, :in_journey, :entry_station

DEFAULT_BALANCE = 0
MINIMUM_FARE = 1
MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @in_journey = in_journey?
   @entry_station = nil
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Sorry insufficient funds available" if insufficient_funds?
    in_journey?(true)
    @entry_station = station 
  end

  def touch_out
    in_journey?(false)
    deduct(MINIMUM_FARE)
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
  end

  def in_journey?(status = false)
    @in_journey = status
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(cost)
    @balance -= cost
  end

end
