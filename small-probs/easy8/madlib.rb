# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly
#
# Do you walk your blue dog quickly? That's hilarious!


def prompt(message)
  puts "==> #{message}"
end

prompt "Enter a noun:"
noun = gets.chomp
prompt "Enter a verb:"
verb = gets.chomp
prompt "Enter an adjective:"
adjective = gets.chomp
prompt "Enter an adverb:"
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample
