class Palindromes
  def initialize(args)
    @max_factor = args[:max_factor].to_i
    @min_factor = args[:min_factor].to_i
    @palindromes = create_palindromes(generate)
  end

  def largest
    @palindromes.max_by(&:value)
  end

  def smallest
    @palindromes.min_by(&:value)
  end

  def create_palindromes(palindromes)
    palindromes.map do |palindrome|
      Palindrome.new(palindrome)
    end
  end

  def generate
    create_products
  end

  def create_products
    @min_factor.upto(@max_factor).inject({}) do |palindromes, factor|
      identify_palindromes(palindromes, factor)
    end
  end

  def identify_palindromes(palindromes, factor)
    @min_factor.upto(@max_factor).each do |multiplier|
      if factor * multiplier == (factor * multiplier).to_s.reverse.to_i
        palindrome = (factor * multiplier)
        if palindromes[palindrome.to_s]
          palindromes[palindrome.to_s] << [factor, multiplier]
        else
          palindromes[palindrome.to_s] = [[factor, multiplier]]
        end
      end
    end
    palindromes
  end
end

class Palindrome
  attr_reader :value, :factors
  def initialize(args)
    @value = args[0].to_i
    @factors = args[1].map(&:sort).uniq
  end
end
