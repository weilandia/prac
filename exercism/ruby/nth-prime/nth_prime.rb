class Prime
  def self.nth(n, primes = [2])
    raise ArgumentError if n == 0
    i = 3
    until primes.length == n do
      primes << i if prime_number(i)
      i += 2
    end
    primes.last
  end

  def prime_number(number)
    return false if number <= 1
    2.upto(Math.sqrt(number).to_i) do |divisor|
      return false if number % divisor == 0
    end
    true
  end

  def self.nate(number_of_prime, primes = [2])
      raise ArgumentError if number_of_prime == 0
      until primes.count == number_of_prime
        number_range = (primes[-1]...primes[-1]**2)
        number_range.detect do |num|
          if !primes.any? do |prime|
              num % prime == 0
            end
            primes << num
          end
        end
      end
      primes.last
  end
end
