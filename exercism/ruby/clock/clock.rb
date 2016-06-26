class Clock
  attr_accessor :hour, :minute
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hour = hour
    @minute = minute
    @minutes = hour * 60 + minute
  end

  def +(addend)
    @minutes = @minutes + addend
    redistribute_minutes(@minutes)
  end

  def -(subtrahend)
    @minutes = @minutes - subtrahend
    redistribute_minutes(@minutes)
  end

  def ==(arg)
    to_s == arg.to_s
  end

  def redistribute_minutes(minutes)
    @hour = minutes / 60
    @minute = minutes - (@hour * 60)
    @hour = @hour % 24
    self
  end

  def to_s
    @hour = "0#{@hour}" if @hour < 10
    @minute = "0#{@minute}" if @minute < 10
    "#{hour}:#{minute}"
  end
end
