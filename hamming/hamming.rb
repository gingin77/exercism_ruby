class Hamming
    def self.compute(top_strand, bottom_strand)
      raise ArgumentError if top_strand.length != bottom_strand.length
      top_strand.chars.zip(bottom_strand.chars).collect{
        |x, y| x == y
      }.count(false)
    end
end

module BookKeeping
  VERSION = 3
end
