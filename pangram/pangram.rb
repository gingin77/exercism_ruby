module BookKeeping
  VERSION = 6
end

# pangram (Greek: παν γράμμα, pan gramma, "every letter") is a sentence using every letter of the alphabet at least once


class Pangram
  def self.pangram?(phrase)
    ('a'..'z').all?(&phrase.downcase.method(:include?))
  end
end
