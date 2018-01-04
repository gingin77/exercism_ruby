module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(n)
    raise ArgumentError if n.zero?
    @n = n
    @primes ||= gen_primes
    @n >= 500 ? primes_over_500 : @primes[@n - 1]
  end

  private

  def self.gen_primes
    obj = *2...3571
    obj.lazy.inject(obj) do |result, el|
      result.reject { |i| i != el && i % el == 0 }
    end
  end

  def self.primes_over_500
    gen_primes_over_500[@n - 1]
  end

  def self.gen_primes_over_500
    can = @primes.last + 2
    while @primes.size < @n
      lmt = Math.sqrt(can).ceil
      factors = *@primes.first..lmt
      if factors.all? { |fact| can % fact != 0 }
        @primes << can
      end
      can += 2
    end
    @primes
  end
end
