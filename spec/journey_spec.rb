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

end
