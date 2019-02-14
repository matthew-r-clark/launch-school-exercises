def prompt(message)
  puts "=> #{message}"
end

prompt "What is your name?"
name = gets.chomp
response = "Hello #{name}."
scream = "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?"

prompt name.end_with?('!') ? scream : response
