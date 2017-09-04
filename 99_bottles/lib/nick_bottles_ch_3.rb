class XBottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).collect {|i| verse(i)}.join("\n")
  end

  def verse(number)
    if number == 0
      "No more bottles of beer on the wall, " +
      "no more bottles of beer.\n" +
      "Go to the store and buy some more, " +
      "99 bottles of beer on the wall.\n"
    else
      "#{amount_name(number)} #{container(number)} of beer on the wall, " +
      "#{amount_name(number)} #{container(number)} of beer.\n" +
      "Take #{direct_object(number)} down and pass it around, " +
      "#{amount_name(number-1).downcase} #{container(number - 1)} of beer on the wall.\n"
    end
  end

  private

    def container(number)
      if number == 1
        "bottle"
      else
        "bottles"
      end
    end

    def amount_name(amount)
      if amount < 1
        "No more"
      else
        amount.to_s
      end
    end

    def direct_object(amount)
      if amount == 1
        "it"
      else
        "one"
      end
    end
end
