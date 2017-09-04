class BeerSong
  VERSION = 2

  def lyrics
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    Verse.new(verse_number).to_s
  end
end

class Verse
  attr_reader :bottle_number
  def initialize(verse_number)
    @bottle_number = BottleNumber.for(verse_number)
  end

  def to_s
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action} " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  def self.for(verse_number)
    case verse_number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(verse_number)
  end

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def successor
    @successor ||= BottleNumber.for(number - 1)
  end

  def to_s
    "#{quantity} #{container}"
  end

  def action
    "Take #{pronoun} down and pass it around,"
  end

  def quantity
    number.to_s
  end

  def container
    "bottles"
  end

  def pronoun
    "one"
  end
end

class BottleNumber0 < BottleNumber
  def successor
    @successor ||= BottleNumber.for(99)
  end

  def action
    "Go to the store and buy some more,"
  end

  def quantity
    "no more"
  end
end

class BottleNumber1 < BottleNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end
