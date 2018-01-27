module BookKeeping
  VERSION = 1
end

class Scale
  NOTES_SHARP = %w(A A# B C C# D D# E F F# G G#)
  NOTES_FLAT = %w(A Bb B C Db D Eb E F Gb G Ab)

  def initialize(tonic, scale, interval = 'mmmmmmmmmmmm')
    @tonic = tonic
    @scale = scale
    @interval = interval
  end

  def name
    @tonic.capitalize + " " + @scale.to_s
  end

  def pitches
    notes = choose_notes
    notes = notes.rotate(notes.index(@tonic.capitalize))

    [].tap do |pitches|
      index_pos = 0
      pitches << notes[0]
      @interval.chars[0..-2].each do |c|
        if c == "m"
          index_pos += 1
        elsif c == "M"
          index_pos += 2
        else
          index_pos += 3
        end
        pitches << notes[index_pos]
      end
    end
  end

  private

  def choose_notes
    if [:chromatic, :minor, :major].include? @scale
      (%w(G D A E B F# C e b f# c# g# d#).include? @tonic) ? NOTES_SHARP : NOTES_FLAT
    elsif [:dorian, :lydian, :phrygian, :octatonic, :pentatonic, :enigma,].include? @scale
      NOTES_SHARP
    else
      NOTES_FLAT
    end
  end
end
