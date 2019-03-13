# Takes in an array of a person's names, and a hash of their title
# and occupation. Returns a greeting that uses the person's full name
# and mentions title and occupation.

def greetings(names, info)
  "Hello, #{names.join(' ')}! Nice to have a " +
  "#{info[:title]} #{info[:occupation]} around."
end

# p greetings(['John', 'Q', 'Doe'],
#   { title: 'Master', occupation: 'Plumber' }) ==
#   "Hello, John Q Doe! Nice to have a Master Plumber around."
p greetings(['Matthew', 'R', 'Clark'],
  { title: 'beginner', occupation: 'Programmer' })
p greetings(['Danielle', 'A.', 'R.C.'],
  { title: 'Master of', occupation: 'Speech Language Pathology' })
p greetings(['Ryan', 'Ploch'],
  { title: 'Senior', occupation: 'Software Engineer' })
