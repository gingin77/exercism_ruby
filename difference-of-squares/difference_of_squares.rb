module BookKeeping
  VERSION = 4
end

class Squares
  def initialize (number)
    @range = 1..number
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    @range.sum**2
  end

  def sum_of_squares
    @range.map { |n| n**2 }.sum
  end
end
