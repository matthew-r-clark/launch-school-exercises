# Iterate through letters in word (case insensitive)
# if letter is in letter_blocks, remove the subarray containing letter
# if letter is not in letter_blocks array, return false

def block_word?(word)
  letter_blocks = [
    ['B', 'O'],['X', 'K'],['D', 'Q'],['C', 'P'],['N', 'A'],['G', 'T'],['R', 'E'],
    ['F', 'S'],['J', 'W'],['H', 'U'],['V', 'I'],['L', 'Y'],['Z', 'M']
  ]

  word.each_char do |char|
    if letter_blocks.flatten.include?(char.upcase)
      index = letter_blocks.flatten.index(char.upcase)
      letter_blocks.delete_at(index / 2)
    else
      return false
    end
  end
  true
end

# ----- LS solution -----
# BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

# def block_word?(string)
#   up_string = string.upcase
#   BLOCKS.none? { |block| up_string.count(block) >= 2 }
# end


p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('Planet') == false
p block_word?('Plates') == true