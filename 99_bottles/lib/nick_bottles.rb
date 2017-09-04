class NickBottles
  def verse(n)
    "#{bottle_count(n).capitalize} of beer on the wall, #{bottle_count(n)} of beer.\n" \
    "#{beer_action(n)}, #{bottle_count(n - 1)} of beer on the wall.\n"
  end

  def verses(start, e)
    [*e..start].reverse.map { |verse_num| verse(verse_num) }.join("\n")
  end

  def song
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
        "no more #{bottle_pluralization(n)}"
      elsif n < 0
        "99 #{bottle_pluralization(n)}"
      elsif n == 6
        "1 six-pack"
      else
        "#{n} #{bottle_pluralization(n)}"
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
