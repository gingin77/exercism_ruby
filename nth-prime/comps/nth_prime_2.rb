module BookKeeping
  VERSION = 1
end

class Prime
  @primes ||= [2,3,5,7,11,13]

  def self.nth(n)
    raise ArgumentError if n.zero?
    n < 7 ? @primes[n - 1] : generate_more_primes(n)
  end

  private

  def self.generate_more_primes(n)
    candidate = @primes.last + 2
    while @primes.size < n
      if is_prime?(candidate)
        @primes << candidate
      end
      candidate += 2
    end
    @primes[n - 1]
  end

  def self.is_prime?(can)
    lmt = Math.sqrt(can)
    primes = @primes
    primes = primes.lazy.reject {|x| x >= lmt }.to_a
    primes << lmt
    primes.all? do |divisor|
      can % divisor != 0
    end
  end
end
