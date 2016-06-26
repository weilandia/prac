class Hexadecimal
  attr_reader :number
  def initialize(number)
    @number = number
  end

  def to_decimal
    number.chars.reverse.map.with_index { |digit, index|
      to_integer(digit.downcase) * (16 ** (index))
    }.inject(:+)
  rescue
    0
  end

  def to_integer(digit)
    if [*"a".."f"].include?(digit)
      [*"a".."f"].index(digit) + 10
    elsif [*"0".."9"].include?(digit)
      digit.to_i
    else
      nil
    end
  end
end
