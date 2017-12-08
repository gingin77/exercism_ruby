module BookKeeping
  VERSION = 4
end

class Squares

  def initialize (number)
    @set = 1..number
  end

  def square_of_sum
    @set.reduce(:+)**2
  end

  def sum_of_squares
    @set.map { |n| n**2  }.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
