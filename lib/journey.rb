class Journey
attr_reader :entry_station, :exit_station, :history_list

  def initialize
    @entry_station = nil
    @exit_station = nil
    @history_list = {}
  end

  def start_journey(station)
    @entry_station = station
  end

  def finish_journey(station)
    @exit_station = station
    history
    @entry_station = nil
  end

  def history
    @history_list = {@entry_station => @exit_station}
  end

  private

  def in_journey?
    !!@entry_station
  end

end
