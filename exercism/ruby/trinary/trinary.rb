class Trinary
  attr_reader :trinary
  def initialize(trinary)
    @trinary = preprocess(trinary)
  end

  def to_decimal
    trinary.map.with_index do |digit, index|
      (digit * (3 ** index))
    end.reduce(:+)
  end

  def preprocess(trinary)
    return [0] if trinary =~ /\D/
    trinary.chars.map(&:to_i).reverse
  end
end
