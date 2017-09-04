require_relative './bottle_number'
class Bottles
  class Verse
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

    private_constant :BottleNumber0
  end
end
