module BookKeeping
  VERSION = 1
end

=begin
Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit])

The algorithm consists of repeating the following over and over:

- take the next available unmarked number in your list (it is prime)
- mark all the multiples of that number (they are not prime)

Repeat until you have processed each number in your range.

When the algorithm terminates, all the numbers in the list that have not
been marked are prime.
=end

class Sieve
  def initialize(number)
    if number > 1
      @range = *2..number
    else
      @range = []
    end
    # puts @range
    @multiples = []
    @expected = []
    @modulo_num = @range[0]
  end

  def sieve()
    @multiples = @range.select { |n| n % @modulo_num == 0 }
    # puts @modulo_num
    @range = @range - @multiples
    @modulo_num = @range[0]
    if !@range.empty?
      @expected = @expected.push(@modulo_num)
    end
  end

  def primes
    @expected = @expected.push(@modulo_num)
    # puts @expected
    while !@range.empty? do
      sieve()
    end
    @expected
  end
end
#
# x = Sieve.new(1)
#
# x.primes
