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

class Bottles
  class Verse
    attr_reader :bottle_number
    def initialize(verse_number)
      @bottle_number = BottleNumber.new(verse_number)
    end

    def to_s
      "#{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall, " +
      "#{bottle_number.quantity} #{bottle_number.container} of beer.\n" +
      "#{bottle_number.action} " +
      "#{bottle_number.successor.quantity} #{bottle_number.successor.container} of beer on the wall.\n"
    end
  end

  private_constant :Verse
end

class Bottles
  class Verse
    class BottleNumber
      attr_reader :number
      def initialize(number)
        @number = number
      end

      def successor
        @successor ||= set_successor
      end

      def action
        if number == 0
          "Go to the store and buy some more,"
        else
          "Take #{pronoun} down and pass it around,"
        end
      end

      def quantity
        if number == 0
          "no more"
        else
          number.to_s
        end
      end

      def container
        if number == 1
          "bottle"
        else
          "bottles"
        end
      end

      def pronoun
        if number == 1
          "it"
        else
          "one"
        end
      end

      private
        def set_successor
          if number == 0
            BottleNumber.new(99)
          else
            BottleNumber.new(number - 1)
          end
        end
    end

    private_constant :BottleNumber
  end
end
