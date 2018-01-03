module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(n)
    raise ArgumentError if n.zero?
    n > 100 ? big_prime(n) : prime(n)
  end

  def self.prime(n)
    first_100_primes[n-1]
  end

  def self.first_100_primes
    first_100_primes = []
    range = *2...542
    first_100_primes = range.lazy.inject(range) do |result, el|
      result.reject do |i|
        i != el && i % el == 0
      end
    end
  end

  def self.big_prime(n)
    find_big_primes[n-1]
  end

  def self.find_big_primes
    upper_range = *542...200000
    big_range = first_100_primes + upper_range
    big_primes = []
    big_primes = first_100_primes.lazy.inject(big_range) do |r, e|
      r.reject do |i|
        i != e && i % e == 0
      end
    end
  end
end
