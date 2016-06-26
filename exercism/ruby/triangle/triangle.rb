class Triangle
  attr_reader :kind
  def initialize(s1, s2, s3)
    @kind = identify([s1, s2, s3])
  end

  def identify(sides)
    validates_triangle(sides)
    if sides.uniq.length == 1
      :equilateral
    elsif sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

  def validates_triangle(sides)
    sides.each_with_index do |side, index|
      raise TriangleError if !triangle?(side, index, sides)
    end
  end

  def triangle?(side, index, sides)
    return false if side <= 0
    return false if fails_triangle_ineqaulity?(side, sides[(index + 1) % 3], sides[(index + 2) % 3])
    true
  end

  def fails_triangle_ineqaulity?(side_one, side_two, side_three)
    side_one + side_two <= side_three
  end
end

class TriangleError < StandardError
  def initialize(msg="Hmm that's not a triangle.")
    super
  end
end
