module BookKeeping
  VERSION = 2
end

RN_CNV = {
  1 => 'I',
  5 => 'V',
  10 => 'X',
  50 => 'L',
  100 => 'C',
  500 => 'D',
  1000 => 'M'
}

class Integer
  def to_roman
    return "No Roman numeral for zero" unless !self.zero?
    num = self.to_s.chars.map(&:to_i).reverse
    num.map.with_index do |digit, index|
      x = (10 ** index)
      if digit < 4
        RN_CNV[x] * digit
      elsif digit == 4
        RN_CNV[x] + RN_CNV[x * 5]
      elsif digit == 5
        RN_CNV[x * 5]
      elsif digit > 5 && digit < 9
        RN_CNV[x * 5] + RN_CNV[x] * (digit - 5)
      elsif digit == 9
        RN_CNV[x] + RN_CNV[10 ** (index + 1)]
      else
        ''
      end
    end.reverse.join('')
  end
end
