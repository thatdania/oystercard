
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
      expect{card.top_up(1)}.to raise_error 'Oystercard limit'
    end

    # it ' returns remaining top up limit' do
    #   expect(subject.top_up)
    # end
    # it 'returns how much left for top up' do
    #   card = Oystercard.new 50
    #   expect(card.top_up(60)).to eq "You can only top up 40"
    # end
  end
end
