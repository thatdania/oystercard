
require './lib/oystercard.rb'

describe Oystercard do

  describe "#balance" do
      it 'Sets new card to have a default balance of 0' do
        expect(subject.balance).to eq 0
      end
    end

  describe "#top_up" do
    it 'Adds money to card' do
    expect(subject.top_up("value")).to eq 5
    end

    it {is_expected.to respond_to{:top_up}.with(1).argument}

  end
end
