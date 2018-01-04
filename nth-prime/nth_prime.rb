module BookKeeping
  VERSION = 1
end

class Prime
  def self.nth(n)
    raise ArgumentError if n.zero?
    @first_100_primes ||= generate_primes_2_100
    n <= 100 ? p_100_and_under(n) : p_over_100(n)
  end

  def self.p_100_and_under(n)
    @first_100_primes[n-1]
  end

  def self.find_primes(obj, arg)
    primes = obj.lazy.inject(arg) do |result, el|
      result.reject do |i|
        i != el && i % el == 0
      end
    end
    primes
  end

  def self.p_over_100(n)
    n < 10001 ? primes_101_10001[n-1] : high_prime_selector(n)
  end

  private

  def self.generate_primes_2_100
    obj = *2...542
    find_primes(obj, obj)
  end

  def self.primes_101_10001
    upper_range = *542...104743
    arg = @first_100_primes + upper_range
    find_primes(@first_100_primes, arg)
  end

  def self.high_prime_selector(n)
    primes = primes_101_10001
    can = primes.last + 2
    while primes.size < n
      factor_limit = Math.sqrt(can)
      factors_to_screen = *primes.first..factor_limit.ceil
      if factors_to_screen.lazy.all? do |p|
          return true if p > can
          can % p != 0
        end
        primes << can
      end
      can += 2
    end
    primes[n-1]
  end
end

  # Find primes works by taking whatever array is given as the canument, passing that canument as the first 'result' and then rejecting every item that meets the block criteria. If dealing with lcane numbers, the process is simplified when the obj array is already filtered to only include primes. For example, use an array of the first_100_primes as the object to filter an array for

  # To find out whether a candidate number is prime, we have to test whether it is divisible by factors only up to the square root of that number.... How can I find an array of primes without finding 100 and then taking from index position n-1?

  # If n = 3, i only need to find 3 primes... I know, 2, 3... whats next? Yeah, of course 5 but.... how could I find that out? What is the next prime after any given #? Incrementing by 2 is one way to skip over all even numbers...I wonder if .step might be useful?
