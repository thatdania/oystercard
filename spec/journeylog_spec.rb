require './lib/JourneyLog.rb'

describe JourneyLog do

context 'When starting a journey' do

  it '#entry_station' do
    subject.log_entry("Kings Cross")
    expect(subject.entry_station).to eq("Kings Cross")
  end
 end

 context 'When ending a journey' do

   it '#exit_station' do
     subject.log_entry("Kings Cross")
     expect(subject.log_exit("Aldgate East")).to eq("Aldgate East")
   end
 end

 context 'Logs journeys' do

   it '#history' do
     subject.log_entry("Kings Cross")
     subject.log_exit("Aldgate East")
     expect(subject.history[-1]).to eq({"Kings Cross" => "Aldgate East"})
   end

   it '#finish_journey' do
     subject.log_entry("Kings Cross")
     subject.log_exit("Aldgate East")
     expect(subject.entry_station).to eq nil
    end
 end


end
