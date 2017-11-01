require './lib/journey.rb'

describe Journey do

  class FakeStation
    attr_reader :zone
    def initialize(name, zone)
      @name = name
      @zone = zone
    end
  end

  let(:first_station) { FakeStation.new("Livepool", 1) }
  let(:second_station) { FakeStation.new("Aldgate East", 2) }
  let(:third_station) { FakeStation.new("Covent Garden", 3) }
  let(:fourth_station) { FakeStation.new("Angel", 4) }

  context "It starts a Journey" do

    it "Have an entry_station" do
      subject.start_journey(first_station)
      expect(subject.starting_journey).to eq(first_station)
    end

  end

  context "When finishing a Journey" do

    it 'Have an exit_station' do
      subject.start_journey(first_station)
      expect(subject.finish_journey(second_station)).to eq(second_station)
    end
  end

  context 'When paying for the journey' do
    it 'returns MINIMUM_FARE if on a complete trip' do
    subject.start_journey(first_station)
    subject.finish_journey(first_station)
    expect(subject.fare).to eq(1)
    end

    it 'returns penalty fare if entry_station is not nil in a new journey' do
      subject.start_journey(first_station)
      subject.start_journey(first_station)
      expect(subject.fare).to eq(6)
    end

    it 'returns penalty fare if exit_station is not nil finishing a journey' do
      subject.start_journey(first_station)
      subject.finish_journey(second_station)
      subject.finish_journey(second_station)
      expect(subject.fare).to eq(6)
    end

    it 'returns penalty fare if exit_station is not nil finishing' do
      subject.finish_journey(second_station)
      expect(subject.fare).to eq(6)
    end
  end

  context 'When calculating fare' do
    it 'returns 1 if in the same zone' do
      subject.start_journey(first_station)
      subject.finish_journey(first_station)
      expect(subject.fare).to eq(1)
    end

    it 'returns 2 if going from 1 to 2' do
      subject.start_journey(first_station)
      subject.finish_journey(second_station)
      expect(subject.fare).to eq(2)
    end

    it 'returns 2 if going from zone 2 to 1' do
      subject.start_journey(second_station)
      subject.finish_journey(first_station)
      expect(subject.fare).to eq(2)
    end

    it 'returns 3 if going from zone 1 to 3' do
      subject.start_journey(first_station)
      subject.finish_journey(third_station)
      expect(subject.fare).to eq(3)
    end

    it 'returns 3 if going from zone 2 to 3' do
      subject.start_journey(second_station)
      subject.finish_journey(third_station)
      expect(subject.fare).to eq(3)
    end

    it 'returns 3 if going from zone 3 to 4' do
      subject.start_journey(third_station)
      subject.finish_journey(fourth_station)
      expect(subject.fare).to eq(3)
    end

  end

end
