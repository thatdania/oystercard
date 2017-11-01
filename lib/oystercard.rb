require_relative 'journey'

class Oystercard

attr_reader :balance

DEFAULT_BALANCE = 0
MINIMUM_FARE = 1
MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @journey = Journey.new
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Sorry insufficient funds available" if insufficient_funds?
    @journey.start_journey(station)
  end

  def touch_out(station)
    deduct(@journey.fare)
    @journey.finish_journey(station)
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(cost)
    @balance -= cost
  end

end
