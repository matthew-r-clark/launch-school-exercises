ALPHA = ('a'..'z').to_a

def decypher(str)
  result = ''
  str.each_char do |char|
    val = char.ord
    if (65..90).include?(val)
      val += 13
      val -= 26 if val > 90
    elsif (97..122).include?(val)
      val += 13
      val -= 26 if val > 122
    end
   
    result << val.chr
  end

  result
end

File.open("encrypted_pioneers_list.txt").each do |line|
  puts decypher(line)
end