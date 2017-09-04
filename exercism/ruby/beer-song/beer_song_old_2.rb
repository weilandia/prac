VERSION = 2
class BeerSong
  def verse(n)
    "#{bottle_count(n).capitalize} #{bottle_pluralization(n)} of beer on the wall, #{bottle_count(n)} #{bottle_pluralization(n)} of beer.\n" \
    "#{beer_action(n)}, #{bottle_count(n - 1)} #{bottle_pluralization(n - 1)} of beer on the wall.\n"
  end

  def verses(start, e)
    [*e..start].reverse.map { |verse_num| verse(verse_num) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end

  private

    def bottle_article(n)
      if n > 0
        n
      else
        "No more"
      end
    end

    def bottle_count(n)
      if n == 0
        "no more"
      elsif n < 0
        "99"
      else
        "#{n}"
      end
    end

    def bottle_pluralization(n)
      if n == 1
        "bottle"
      else
        "bottles"
      end
    end

    def beer_action(n)
      if n > 0
        "Take #{direct_object(n)} down and pass it around"
      else
        "Go to the store and buy some more"
      end
    end

    def direct_object(n)
      if n == 1
        "it"
      else
        "one"
      end
    end
end
