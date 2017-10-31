
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
    @entry_station = station
    in_journey?
  end

  def touch_out
    @entry_station = nil
    deduct(MINIMUM_FARE)
    in_journey?
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
  end

  def in_journey?
    @entry_station != nil ? @in_journey = true : @in_journey = false
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(cost)
    @balance -= cost
  end

end
