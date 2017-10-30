
require './lib/oystercard.rb'

describe Oystercard do
  it 'Sets new card to have a default balance of 0' do
  expect(Oystercard.new.balance).to eq 0 
  end
end
