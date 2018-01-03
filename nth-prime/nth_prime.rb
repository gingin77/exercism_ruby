module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(n)
    raise ArgumentError if n.zero?
    n > 100 ? primes_over_100(n) : primes_100_and_under(n)
  end

  def self.find_primes(obj, arg)
    primes = obj.lazy.inject(arg) do |result, el|
      result.reject do |i|
        i != el && i % el == 0
      end
    end
    primes
  end

  def self.primes_100_and_under(n)
    first_100_primes[n-1]
  end

  def self.primes_over_100(n)
    primes_upto_cap[n-1]
  end

  private

  # candidates to test: everything less than and upto the square root

  def self.first_100_primes
    @first_100_primes ||= generate_first_100_primes
  end

  def self.generate_first_100_primes
    obj = *2...542
    find_primes(obj, obj)
  end

  def self.primes_upto_cap
    obj = first_100_primes
    cap = obj.last ** 2
    upper_range = *542...cap
    arg = first_100_primes + upper_range
    find_primes(first_100_primes, arg)
  end
end
