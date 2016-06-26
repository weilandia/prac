class SecretHandshake
  def initialize(int)
    @bits = convert(int)
  end

  def convert(int)
    begin
      bit_push(int, [])
    rescue
      return []
    end
  end

  def bit_push(int, bits)
    while int > 0
      bits.push(int % 2)
      int = int / 2
    end

    bits
  end

  def commands
    binary = @bits.map.with_index do |bit, i|
      moves[i] if bit > 0
    end.compact

    binary.reverse!.shift if binary.include?("reverse")

    binary
  end

  def moves
    ["wink", "double blink", "close your eyes", "jump", "reverse"]
  end
end
