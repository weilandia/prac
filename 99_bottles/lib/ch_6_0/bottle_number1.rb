class Bottles
  class Verse
    class BottleNumber1 < BottleNumber
      def container
        "bottle"
      end

      def pronoun
        "it"
      end
    end

    private_constant :BottleNumber1
  end
end
