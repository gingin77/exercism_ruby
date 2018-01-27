module BookKeeping
  VERSION = 1
end

class Scale
  NOTES_SHARP = %w(A A# B C C# D D# E F F# G G#)
  NOTES_FLAT = %w(A Bb B C Db D Eb E F Gb G Ab)
  
  TONICS_THAT_USE_FLATS = %w(F Bb Eb Ab Db Gb d g c f bb eb)
  STEP_HASH = { "m" => 1, "M" => 2, "A" => 3}

  def initialize(tonic, scale, interval = 'mmmmmmmmmmmm')
    @tonic = tonic
    @scale = scale
    @interval = interval
    @notes = choose_notes_and_rotate
  end

  def name
    @tonic.capitalize + " " + @scale.to_s
  end

  def pitches
    [].tap do |pitches|
      pitches << @notes[0]
      index_pos = 0
      @interval.chars[0..-2].each do |c|
        index_pos += STEP_HASH[c]
        pitches << @notes[index_pos]
      end
    end
  end

  private

  def choose_notes_and_rotate
    notes = (TONICS_THAT_USE_FLATS.include? @tonic) ? NOTES_FLAT : NOTES_SHARP
    notes = notes.rotate(notes.index(@tonic.capitalize))
  end
end
