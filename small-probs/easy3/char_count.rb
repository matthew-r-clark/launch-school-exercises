def prompt(msg)
  puts "=> #{msg}"
end

prompt "Please write a word or multiple words:"
text = gets.chomp

count = 0
text.each_char do |letter|
  if ('a'..'z').include?(letter) or ('A'..'Z').include?(letter)
    count += 1
  end
end

prompt "There are #{count} characters in \"#{text}\"."
