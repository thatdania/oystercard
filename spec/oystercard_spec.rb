require './lib/oystercard.rb'

class Oystercard
LIMIT = 90
MINIMUM_FARE = 1
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
    @state = :not_in_use
  end

  def top_up(amount)
    raise error_top_up if @balance + amount > LIMIT
    @balance += amount
  end

  def error_top_up
    "You are exceeding the limit in your card. You can top_up only #{LIMIT - @balance}"
  end

  def touch_in
    raise 'Insufficient balance for travel' if @balance < MINIMUM_FARE
    @state = :in_use
  end

  def touch_out
    deduct if @state == :in_use
    @state = :not_in_use
  end

  def in_journey?
    @state == :in_use
  end

  private

  def deduct
    @balance -= MINIMUM_FARE
  end
end
