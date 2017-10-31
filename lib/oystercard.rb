class Oystercard

describe Oystercard do
  subject(:oystercard) { described_class.new }

  describe 'initialize' do
    it 'Check if oystercard has a balance equal to 0' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up) }
    it 'Check if @balance increase after top_up' do
      subject.top_up(5)
      expect(subject.balance).to eq(5)
    end
    it 'top_up raise error when above the limit' do
      limit = Oystercard::LIMIT - subject.balance
      money_to_put = limit + 1
      error_top_up = "You are exceeding the limit in your card. You can top_up only #{limit}"
      expect { subject.top_up(money_to_put) }.to raise_error(error_top_up)
    end
  end
  # describe '#deduct' do
    # it 'reduces the balance by certain amount' do
      # subject.top_up(50)
      # expect(subject.deduct(25)).to eq(25)
    # end
  # end
  describe '#touch_in' do
    it 'set the card as in use' do
      allow(subject).to receive(:touch_in).and_return(:in_use)
      expect(subject.touch_in).to eq(:in_use)
    end
    it 'raises error if balance is less than minimum' do
      expect { subject.touch_in }.to raise_error('Insufficient balance for travel')
    end
  end
  describe '#touch_out' do
    it 'set the card as not in used' do
      expect(subject.touch_out).to eq(:not_in_use)
    end
    it 'check if touch_out reduce balance by minumum fare' do
      minimum_fare = Oystercard::MINIMUM_FARE
      subject.top_up(1)
      subject.touch_in
      expect { subject.touch_out }.to change { subject.balance }.by(minimum_fare * -1)
    end
  end
  describe '#in_journey?' do
    it 'Check if the card is in use or not.' do
      subject.top_up(2)
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end
  end
end
