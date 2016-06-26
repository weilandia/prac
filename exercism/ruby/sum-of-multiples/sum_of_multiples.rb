module Multiples
  def Multiples.included cls
    cls.extend Multiples
  end

  def find_multiples(n, set)
    set.inject([]) do |arr, multiple|
      current_multiple = multiple
      while current_multiple < n
        arr << current_multiple
        current_multiple = current_multiple + multiple
      end
      arr.uniq.sort
    end
  end

  def sum_multiples(n, multiples)
    [*1...n].select do |number|
      multiples.include?(number)
    end.inject(:+).to_i
  end
end

class SumOfMultiples
  include Multiples
  def initialize(*set)
    @multiples_set = set
  end

  def self.to(n)
    sum_multiples(n, find_multiples(n, [3, 5]))
  end

  def to(n)
    sum_multiples(n, find_multiples(n, @multiples_set))
  end
end
