class Hamming
  def self.compute(top_strand, bottom_strand)
    raise ArgumentError, "The strand lengths do not match" if top_strand.length != bottom_strand.length
    top_strand.chars.zip(bottom_strand.chars).count{|x, y| x != y}
  end
end

module BookKeeping
  VERSION = 3
end
