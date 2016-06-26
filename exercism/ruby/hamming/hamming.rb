VERSION = 1

class Hamming
  VERSION = 1
  def self.compute(strand_one, strand_two)
    @strand_one = strand_one
    @strand_two = strand_two
    validate_strands
    hamming_distance = 0
    @strand_one.each_with_index do |n, i|
      if n != @strand_two[i] then hamming_distance += 1 end
    end
    hamming_distance
  end

  def self.validate_strands
    strands_must_be_same_length
    @strand_one = @strand_one.chars
    @strand_two = @strand_two.chars
  end

  def self.strands_must_be_same_length
    if @strand_one.length != @strand_two.length
      raise ArgumentError
    end
  end
end

# ('AG', 'CT')
