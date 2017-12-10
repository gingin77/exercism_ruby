module BookKeeping
  VERSION = 6
end

# pangram (Greek: παν γράμμα, pan gramma, "every letter") is a sentence using every letter of the alphabet at least once

class Pangram
  REQUIRED = [*('a'..'z')]
  def self.pangram? (phrase)
    REQUIRED.all? {|char| phrase.downcase.chars.include? char}
  end
end
