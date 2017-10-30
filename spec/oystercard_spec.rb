
require './lib/oystercard.rb'

describe Oystercard do

  describe "#balance" do
      it 'Sets new card to have a default balance of 0' do
        expect(subject.balance).to eq 0
      end
    end

  describe "#top_up" do
    it 'Adds money to card' do
<<<<<<< HEAD
    expect{subject.top_up(1)}.to change{subject.balance }.by(1)
    end

    it {is_expected.to respond_to{:top_up}.with(1).argument}

    it 'raises error' do
      card = Oystercard.new 90
      expect{card.top_up(1)}.to raise_error 'Oystercard has reached the limit'
    end
=======
    expect(subject.top_up("value")).to eq 5
    end

    it {is_expected.to respond_to{:top_up}.with(1).argument}
>>>>>>> c99dd74e31e668f212f4c5d08c91c05af57eb33b

  end
end
