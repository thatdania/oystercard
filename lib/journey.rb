class Journey
attr_reader :entry_station, :exit_station, :history_list

  def initialize
    @entry_station = nil
    @exit_station = nil
    @history_list = {}
    @fare = 1
  end

  def start_journey(station)
    @fare = 6 if in_journey?
    @entry_station = station
  end

  def finish_journey(station)
    @fare = 6 unless in_journey?
    @exit_station = station
    do_finish
  end

  def history
    @history_list = {@entry_station => @exit_station}
  end

  def fare
    @fare
  end

  private

  def do_finish
    history
    @entry_station = nil
    @exit_station
  end

  def penalty
    @entry_station != nil & in_journey?
  end

  def in_journey?
    !!@entry_station
  end

end
