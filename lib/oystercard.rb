
class Oystercard

attr_accessor :balance

DEFAULT_BALANCE = 0

  def initialize (balance = DEFAULT_BALANCE)
   @balance = balance
  end

def top_up(value)
  if @balance > 90 || @balance + value > 90
    raise 'Oystercard has reached the limit'
  else
    @balance = @balance + value
  end
end

# def balance(value = DEFAULT_BALANCE)
#   @value
# end


end
