module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(n)
    raise ArgumentError if n.zero?
    @primes ||= [2,3]
    candidate = @primes.last + 2
    while @primes.size < n
      if is_prime?(candidate)
        @primes << candidate
      end
      candidate += 2
    end
    @primes[n - 1]
  end

  private

    def self.is_prime?(can)
      factor = Math.sqrt(can)
      @primes.all? do |p|
        return true if p > factor
        can % p != 0
      end
    end
end
