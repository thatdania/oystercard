
require './lib/oystercard.rb'

describe Oystercard do
  class FakeStation
    attr_reader :zone
    def initialize(name, zone)
      @name = name
      @zone = zone
    end
  end

  let(:first_station) { FakeStation.new("Livepool", 1) }
  let(:second_station) { FakeStation.new("Aldgate East", 2) }

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

    it 'Does not allow @balance to be over 90' do
      card = Oystercard.new 90
      expect{card.top_up(1)}.to raise_error 'Oystercard has reached the limit'
    end
  end

   describe '#touch_in' do

     it "@balance must be at least 1 to touch_in" do
       expect{subject.touch_in(first_station)}.to raise_error "Sorry insufficient funds available"
     end

     it "Updates @entry_station when touching in " do
       subject.top_up(2)
       expect(subject.touch_in(first_station)).to eq first_station
     end

   end

   describe '#touch_out' do
     let (:topped_up_card) do
       subject.top_up(2)
       subject.touch_in(first_station)
     end

     it "Deducts MINIMUM_FARE from @balance" do
       topped_up_card
       expect { subject.touch_out(second_station) }.to change{ subject.balance }.from(2).to(1)
     end

   end


end
