
class Oystercard

attr_accessor :balance

DEFAULT_BALANCE = 0

  def initialize (balance = DEFAULT_BALANCE)
   @balance = balance
  end

def top_up(value)
<<<<<<< HEAD
  if @balance > 90 || @balance + value > 90
    raise 'Oystercard has reached the limit'
  else
    @balance = @balance + value
  end
=======
  5
>>>>>>> c99dd74e31e668f212f4c5d08c91c05af57eb33b
end

# def balance(value = DEFAULT_BALANCE)
#   @value
# end


end
