require_relative 'journey'

class Oystercard

attr_reader :balance, :in_journey, :entry_station, :exit_station, :journey_history

DEFAULT_BALANCE = 0
MINIMUM_FARE = 1
MAXIMUM_BALANCE = 90

  def initialize(balance = DEFAULT_BALANCE)
   @balance = balance
   @journey = Journey.new
   @journey_history = []
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
    return_station = @journey.finish_journey(station)
    update_journey_history
    return_station
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

  def update_journey_history
    @journey_history << @journey.history_list
  end

end
