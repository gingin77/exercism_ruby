require 'minitest/autorun'
require_relative 'nth_prime'

# Common test data version: 1.0.0 016d65b
class NthPrimeTest < Minitest::Test
  def test_first_prime
    # skip
    assert_equal 2, Prime.nth(1)
  end

  def test_second_prime
    # skip
    assert_equal 3, Prime.nth(2)
  end

  def test_sixth_prime
    # skip
    assert_equal 13, Prime.nth(6)
  end

  def test_one_hundredth_prime
    # skip
    assert_equal 541, Prime.nth(100)
  end

  def test_big_prime
    # skip
    assert_equal 104743, Prime.nth(10001)
  end

  def test_cap_limit
    assert_equal 292679, Prime.nth(25438)
  end

  def test_bigger_prime
    skip
    assert_equal 1299721, Prime.nth(100001)
  end

  def test_there_is_no_zeroth_prime
    skip
    assert_raises(ArgumentError) { Prime.nth(0) }
  end

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
