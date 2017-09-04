class Bottles
  class Verse
    class BottleNumber
      def self.for(verse_number)
        case verse_number
        when 0
          BottleNumber0
        when 1
          BottleNumber1
        when 6
          BottleNumber6
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

    private_constant :BottleNumber
  end
end
