class DNA

  def initialize(strand)
    @strand = strand
  end

  def nucleotides
    { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }
  end

  def count(nucleotide)
    @strand.each_char.count { |n| n == nucleotide}
  end

  def histogram
    @strand.each_char.with_object(nucleotides) { |n, nucleotides|
      nucleotides[n] += 1
    }
  end
end

class Nucleotide
  def self.from_dna(strand)
    raise ArgumentError, "A valid strand should only contain the following symbols: 'A', 'C',
    'G', and 'T'." if nucleotide_error(strand)
    DNA.new(strand)
  end

  private
    def self.nucleotide_error(strand)
      strand.gsub(/[ATCG]/, "").length != 0
    end
end
