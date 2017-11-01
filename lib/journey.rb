class Journey
attr_reader :starting_journey

  def initialize
    @starting_journey = nil
    @fare = 1
    @journey_log = JourneyLog.new
  end

  def start_journey(station)
    @fare = 6 if in_journey?
    @starting_journey = @journey_log.log_entry(station)
  end

  def finish_journey(station)
    @fare = 6 unless in_journey?
    return_station = @journey_log.log_exit(station)
    @starting_journey = nil
    return_station
  end

  def fare
    @fare
  end

  private

  def penalty
    @starting_journey != nil & in_journey?
  end

  def in_journey?
    !!@starting_journey
  end

end
