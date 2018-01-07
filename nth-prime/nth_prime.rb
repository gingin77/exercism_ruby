module BookKeeping
  VERSION = 1
end

class Prime
  @primes ||= [2, 3]

  def self.nth(n)
    raise ArgumentError if n.zero?
    @n = n
    more_primes[@n - 1]
  end

  def self.more_primes
    candidate = @primes.last + 2
    while @primes.size < @n
      if is_prime?(candidate)
        @primes << candidate
      end
      candidate += 2
    end
    @primes
  end

  def self.is_prime?(candidate)
    sqrt = Math.sqrt(candidate)
    @primes.all? do |divisor|
      return true if divisor > sqrt
      candidate % divisor != 0
    end
  end

  private_class_method :is_prime?, :more_primes
end
