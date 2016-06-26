class Binary
  VERSION = 1

  def initialize(binary)
    @binary = binary.to_s
    raise ArgumentError.new(error_message) unless self.binary?
  end

  def to_decimal
    power = @binary.length
    @binary.chars.map do |d|
      power -= 1
      d.to_i * (2 ** power)
    end.inject(:+)
  end

  def binary?
    /\A[01]+\Z/.match(@binary)
  end

  def error_message
    "Only binary numbers are allowed, passed as strings."
  end
end
