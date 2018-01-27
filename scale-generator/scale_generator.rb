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

    result = []
    result << notes[0]
    index_pos = 0

    @interval.chars[0..-2].each do |c|
      if c == "m"
        index_pos += 1
      elsif c == "M"
        index_pos += 2
      else
        index_pos += 3
      end
      result << notes[index_pos]
    end
    result
  end

  private

  def choose_notes
    if [:chromatic, :minor, :major].include? @scale
      if %w(G D A E B F# C e b f# c# g# d#).include? @tonic
        NOTES_SHARP
      elsif %w(F Bb Eb Ab Db Gb a d g c f bb eb).include? @tonic
        NOTES_FLAT
      end
    elsif [:dorian, :lydian, :phrygian, :octatonic, :pentatonic, :enigma,].include? @scale
      NOTES_SHARP
    elsif [:mixolydian, :locrian, :harmonic_minor, :hexatonic].include? @scale
      NOTES_FLAT
    end
  end
end
