require_relative './bottle_number'
require_relative './bottle_number0'
require_relative './bottle_number1'
require_relative './bottle_number6'
require 'pry'
class Bottles
  class Verse
    attr_reader :bottle_number
    def initialize(verse_number)
      @bottle_number = BottleNumber.for(verse_number)
    end

    def to_s
      "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" +
      "#{bottle_number.action} " +
      "#{bottle_number.successor} of beer on the wall.\n"
    end
  end

  private_constant :Verse
end
