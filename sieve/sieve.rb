module BookKeeping
  VERSION = 1
end

class Sieve
  def initialize(lmt)
    @lmt = lmt
  end

  def primes
    to_markout = [nil,nil,*2..@lmt]
    to_step_with = *2..Math.sqrt(@lmt)
    to_step_with.inject(to_markout) do |mrk_out_ary, stepper|
      (stepper**2..@lmt).step(stepper) do |i|
        mrk_out_ary[i] = nil
      end
      mrk_out_ary
    end.compact
  end
end
