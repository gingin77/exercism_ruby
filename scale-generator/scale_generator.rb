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
    @tonic.upcase + " " + @scale.to_s
  end

  def pitches
    @notes = choose_notes
    @tonic = modify_tonic
    index_pos = @notes.index(@tonic)

    result = []
    result << @notes[index_pos]

    previous_index_pos = index_pos

    @interval.chars[0..-2].each do |c|
      if c == "m"
        step = 1
        index_pos += 1
      elsif c == "M"
        step = 2
        index_pos += 2
      else
        step = 3
        index_pos += 3
      end

      if @notes[index_pos] != nil
        result << @notes[index_pos]
      else
        index_pos = (previous_index_pos + step) - (@notes.size)
        result << @notes[index_pos]
      end
      previous_index_pos = index_pos
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

  def modify_tonic
    if @tonic.chars.size == 1
      @tonic.chars[0].upcase
    else
      @tonic.chars[0].upcase + @tonic.chars[1]
    end
  end
end
