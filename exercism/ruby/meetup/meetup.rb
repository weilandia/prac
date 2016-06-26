class Meetup
  def initialize(month, year)
    @month = month
    @year = year
    @date = Date.new(@year, @month)
  end

  def day(weekday, week, date = @date)
    days = []
    while date.mon == @month
      days << date if date.send(weekday.to_s + "?")
      date = date.next_day
    end
    send(week, days)
  end

  def teenth(days)
    days.find { |d| d.day > 12 && d.day < 20 }
  end

  def first(days)
    days.first
  end

  def second(days)
    days[1]
  end

  def third(days)
    days[2]
  end

  def fourth(days)
    days[3]
  end

  def last(days)
    days.last
  end
end
