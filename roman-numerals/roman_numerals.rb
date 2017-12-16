module BookKeeping
  VERSION = 2
end

AMPLIFIER = {
  0 => [0, 5],
  1 => [1, 6, 4, 9],
  2 => [2, 7],
  3 => [3, 8]
}

LETTERS = {
  0 => ["I", "V", "X"],
  1 => ["X", "L", "C"],
  2 => ["C", "D", "M"],
  3 => ["M"]
}

SEQ_ASSIGNER = {
  :opt_1 => [1, 2, 3],
  :opt_2 => [4],
  :opt_3 => [5],
  :opt_4 => [6,7,8],
  :opt_5 => [9],
  :opt_6 => [0]
}

class Integer
  def to_roman
    return "No Roman numeral for zero" unless !self.zero?
    num = self.to_s.chars.map(&:to_i).reverse
    posn_hash = Hash[(0...num.length).zip num]
    posn_hash.map do |index, digit|
      letter_ary = get_letters(index)
      amplifier = amplifier(digit)
      seq_option = get_seq_assign(digit)
      rom_num = get_rom_num(letter_ary, amplifier, seq_option)
    end.reverse.join('')
  end

  def get_letters(index)
    LETTERS.select {|l| index == l }.values.join('')
  end

  def get_seq_assign(digit)
    SEQ_ASSIGNER.select do |k, ary|
      ary.map do |r|
        if r == digit
          return k
        end
      end
    end
  end

  def amplifier(digit)
    AMPLIFIER.select do |k, ary|
      ary.map do |r|
        if r == digit
          return k
        end
      end
    end
  end

  def get_rom_num(letter_ary, amplifier, seq_option)
    case seq_option
    when :opt_1
      letter_ary[0] * amplifier
    when :opt_2
      [letter_ary[0], letter_ary[1]].join('')
    when :opt_3
      letter_ary[1]
    when :opt_4
      [letter_ary[1], letter_ary[0] * amplifier].join('')
    when :opt_5
      [letter_ary[0] * amplifier, letter_ary[2]].join('')
    else
      ''
    end
  end
end
