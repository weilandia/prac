class Nanosecond
  VERSION = 1
  def initialize(time)
    @seconds = seconds_alive(time)
  end

  def seconds_alive(time)
    Time.now.to_f - time.to_f
  end

  def minutes_alive
    @seconds / 60
  end

  def hours_alive
    @seconds / 60 / 60
  end

  def days_alive
    @seconds / 60 / 60 / 24
  end

  def nanosecond_alive
    @seconds * (10**9)
  end
end
