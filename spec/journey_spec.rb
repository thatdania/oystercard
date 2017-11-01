require './lib/journey.rb'
describe Journey do

  context "It starts a Journey" do

    it "Have an entry_station" do
      subject.start_journey("Kings Cross")
      expect(subject.entry_station).to eq("Kings Cross")
    end

  end

  context "When finishing a Journey" do

    it 'Have an exit_station' do
      subject.start_journey("Kings Cross")
      expect(subject.finish_journey("Aldgate East")).to eq("Aldgate East")
    end

    it 'Saves the history' do
      subject.start_journey("Kings Cross")
      subject.finish_journey("Aldgate East")
      expect(subject.history_list).to eq({"Kings Cross" => "Aldgate East"})
    end
  end

  context 'When paying for the journey' do
    it 'returns MINIMUM_FARE if on a complete trip' do
    subject.start_journey("Kings Cross")
    subject.finish_journey("Aldgate East")
    expect(subject.fare).to eq(1)
    end

    it 'returns penalty fare if entry_station is not nil in a new journey' do
      subject.start_journey("Kings Cross")
      subject.start_journey("Kings Cross")
      expect(subject.fare).to eq(6)
    end

    it 'returns penalty fare if exit_station is not nil finishing a journey' do
      subject.start_journey("Kings Cross")
      subject.finish_journey("Aldgate East")
      subject.finish_journey("Aldgate East")
      expect(subject.fare).to eq(6)
    end

    it 'returns penalty fare if exit_station is not nil finishing' do
      subject.finish_journey("Aldgate East")
      expect(subject.fare).to eq(6)
    end
  end

end
