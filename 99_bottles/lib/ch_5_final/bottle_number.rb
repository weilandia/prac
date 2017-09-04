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
