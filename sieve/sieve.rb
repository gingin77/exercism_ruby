module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(number)
    @range = *2..number
    @multiples = []
    @expected = []
    @modulo_num = @range[0]
  end

  def sieve()
    unless @modulo_num.nil?
      @expected = @expected.push(@modulo_num)
    end
    @multiples = @range.select { |n| n % @modulo_num == 0 }
    @range = @range - @multiples
    @modulo_num = @range[0]
  end

  def primes
    while !@range.empty? do
      sieve()
    end
    @expected
  end
end


x = Sieve.new(1)
x.primes

y = Sieve.new(2)
y.primes

q = Sieve.new(13)
q.primes
