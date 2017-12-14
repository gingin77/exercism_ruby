module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(top_limit)
    @range = *2..top_limit
    @primes = []
  end

  def primes
    sieve() until @range.empty?
    @primes.compact
  end

  def sieve()
    @primes << @range[0]
    @range = @range - @range.select { |n| n % @range[0] == 0 }
  end
end

# x = Sieve.new(13)
# x.primes

# class Sieve
#   def initialize(max)
#     @max = max
#   end
#
#   def primes
#     main, marked = [*2..Math.sqrt(@max)], [*2..@max]
#     puts "printing main #{main}"
#     puts "printing marked #{marked}"
#     # main, marked = [*2..Math.sqrt(@max)], [*2..@max]
#     # => [[2, 3, 4], [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]]
#
#     main.reduce(marked) do |list, i|
#       # puts list
#       # puts "^^list; i next"
#       # puts i
#       (i**2..@max).step(i) { |c| list[c - 2] = nil }
#       list
#     end.compact
#   end
# end
#
# x = Sieve.new(13)
# x.primes
#
# def eratosthenes(n)
#   nums = [nil, nil, *2..n]
#   (2..Math.sqrt(n)).each do |i|
#     puts i
#     (i**2..n).step(i) do |m|
#       puts "printing m #{m}"
#       nums[m] = nil
#     end if nums[i]
#   end
#   nums.compact
# end


=begin
2 directions I'd like to pursue
1. Use .step and/or .reduce somehow to refactor my code
2. Revisit the wiki page and follow the method here: https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Overview
=end
