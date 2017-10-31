
require './lib/oystercard.rb'

describe Oystercard do

  describe "#balance" do
      it 'Sets new card to have a default balance of 0' do
        expect(subject.balance).to eq 0
      end
    end

  describe "#top_up" do
    it 'Adds money to card' do
    expect{subject.top_up(1)}.to change{subject.balance }.by(1)
    end

    it {is_expected.to respond_to{:top_up}.with(1).argument}

    it 'raises error' do
      card = Oystercard.new 90
      expect{card.top_up(1)}.to raise_error 'Oystercard has reached the limit'
    end
  end

  describe "#deduct" do
    it "Deducts money from a card" do
      card = Oystercard.new 20
      expect(card.deduct(2)). to eq 18
    end
  end

   describe "#in_journey?" do
     it "Journey status should be false by default" do
       expect(subject.in_journey?).to eq false
     end
   end
end
