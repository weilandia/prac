
class Squares
  VERSION = 1
  attr_reader :d
  def initialize(n)
    @d = digits_array(n)
  end

  def digits_array(n)
    (1..n).to_a
  end

  def square_of_sums
    d.inject(:+)**2
  end

  def sum_of_squares
    d.map { |n| n**2 }.inject(:+)
  end

  def difference
    square_of_sums - sum_of_squares
  end
end
