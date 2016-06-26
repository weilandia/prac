class Complement
VERSION = 3
  def self.of_dna(dna)
    dna.chars.map do |n|
      if n == 'G' then n = 'C'
      elsif n == 'C' then n = 'G'
      elsif n == 'T' then n = 'A'
      elsif n == 'A' then n = 'U'
      else raise ArgumentError end
    end.join
  end

end
