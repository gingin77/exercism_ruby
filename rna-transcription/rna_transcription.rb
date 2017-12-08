module BookKeeping
  VERSION = 4
end

class Complement

  DNA_TO_RNA = {
    'A' => 'U',
    'T' => 'A',
    'G' => 'C',
    'C' => 'G'
  }

  def self.of_dna(dna_seq)
    return '' unless dna_seq.chars.all? {|ltr| DNA_TO_RNA.keys.include? ltr}
    rna_seq = dna_seq.chars.map { |base| DNA_TO_RNA[base] }.join("")
  end
end
