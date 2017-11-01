require './lib/journey.rb'
describe Journey do

  context "It starts a Journey" do

    it "Have an entry_station" do
      subject.start_journey("Kings Cross")
      expect(subject.entry_station).to eq("Kings Cross")
    end

    # it "It is on a journey" do
    #   subject.start_journey("Kings Cross")
    #   expect(subject.in_journey?).to eq(true)
    # end

  end

  context "When finishing a Journey" do

    it 'Have an exit_station' do
      subject.start_journey("Kings Cross")
      subject.finish_journey("Aldgate East")
      expect(subject.exit_station).to eq("Aldgate East")
    end

    # it 'It is not on a journey' do
    #   subject.start_journey("Kings Cross")
    #   subject.finish_journey("Aldgate East")
    #   expect(subject.in_journey?).to eq(false)
    # end

    it 'Saves the history' do
      subject.start_journey("Kings Cross")
      subject.finish_journey("Aldgate East")
      expect(subject.history_list).to eq({"Kings Cross" => "Aldgate East"})
    end
  end

end
