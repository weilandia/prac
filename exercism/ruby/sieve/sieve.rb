class Sieve
  attr_reader :range

  def initialize(n)
    @range = (2..n)
  end

  def primes
    range.step { |number| delete_composites(number) }
  end

  def delete_composites(prime)
    [*prime..(range.last)].each do |number|
      range.delete(prime * number)
    end
  end
end
