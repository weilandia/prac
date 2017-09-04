require_relative './bottle_number'
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
