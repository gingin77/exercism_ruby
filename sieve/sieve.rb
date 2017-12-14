module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(number)
    @range = *2..number
    @expected = []
  end

  def primes
    sieve() until @range.empty?
    @expected
  end

  def sieve()
    modulo_num = @range[0]
    @expected = @expected.push(modulo_num) unless modulo_num.nil?
    @range = @range - @range.select { |n| n % modulo_num == 0 }
  end
end
