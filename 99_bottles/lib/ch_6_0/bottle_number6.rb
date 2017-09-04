class Bottles
  class Verse
    class BottleNumber6 < BottleNumber
      def container
        "six-pack"
      end

      def quantity
        "1"
      end
    end

    private_constant :BottleNumber6
  end
end
