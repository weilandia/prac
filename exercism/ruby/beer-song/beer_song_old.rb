class BeerSong
  VERSION = 2

  def verse(current_verse)
    stanza(current_verse)
  end

  def verses(current_verse, last)
    song = []
    until current_verse == last - 1
      song << stanza(current_verse)
      song << "\n"
      current_verse -= 1
    end
    song.pop
    song.join
  end

  def lyrics
    verses(99, 0)
  end

  def next_verse(number)
    number == 0 ? "no more" : (number - 1)
  end

  def pluralize_bottle(number)
    number != 1 ? "bottles" : "bottle"
  end

  def stanza(number)
    return final_verse if number == 0
    return penultimate_verse if number == 1
    "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
    "Take one down and pass it around, #{next_verse(number)} #{pluralize_bottle(number - 1)} of beer on the wall.\n"
  end

  def penultimate_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def final_verse
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end
