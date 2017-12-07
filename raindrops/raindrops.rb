module BookKeeping
  VERSION = 3
end

SOUNDS = {
  3 => 'Pling',
  5 => 'Plang',
  7 => 'Plong'
}

class Raindrops
  def self.convert(number)
    sound = SOUNDS.select {|factor| (number % factor).zero? }.values
    sound.empty? ? number.to_s : sound.join
  end
end
