require 'pry'
class Diamond
  def self.make_diamond(letter)
    Diamond.new(letter).to_s
  end

  attr_reader :letters
  attr_accessor :result

  def initialize(letter)
    @result = []
    @letters = diamond_letters(letter)

    make_diamond
  end

  def to_s
    result.join
  end

  def print
    puts self.to_s
  end

  private

    def make_diamond
      letters.inject(0) { |incr, l|
        cur_line = line
        if incr == 0 || incr == diamond_size
          cur_line[mid_point] = l
        else
          cur_line[mid_point + incr] = l
          cur_line[mid_point - incr] = l
        end
        result << cur_line + "\n"
        incr += 1
      }

      result[0..-2].reverse.each { |l|
        result << l
      }
    end

    def diamond_letters(last_letter)
      [*"A"..last_letter]
    end

    def diamond_size
      letters.length * 2 - 1
    end

    def mid_point
      letters.length - 1
    end

    def line
      " " * diamond_size
    end
end

if ARGV[0]
  Diamond.new(ARGV[0]).print
end
