require_relative './verse'
class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect { |i| verse(i) }.join("\n")
  end

  def verse(verse_number)
    Verse.new(verse_number).to_s
  end
end
