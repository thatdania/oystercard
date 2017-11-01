class JourneyLog

  attr_reader :entry_station, :exit_station, :history

def initialize
  @entry_station = nil
  @exit_station = nil
  @history = []
end

def log_entry(station)
 @entry_station = station
end

def log_exit(station)
@exit_station = station
do_exit
end

private

def do_exit
  log_history
  @entry_station = nil
  @exit_station
end

def log_history
  @history << {@entry_station => @exit_station}
end

end
