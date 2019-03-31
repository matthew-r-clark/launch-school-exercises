# For this exercise, keep in mind the following two terms (mutually exclusive):

# initials = 1 character
# words = 2+ characters (no dots allowed)
# A valid name is a name written in one of the following ways:

# H. Wells
# H. G. Wells
# Herbert G. Wells
# Herbert George Wells
# The following names are invalid:

# Herbert or Wells (single names not allowed)
# H Wells or H. G Wells (initials must end with dot)
# h. Wells or H. wells or h. g. Wells (incorrect capitalization)
# H. George Wells (middle name expanded, while first still left as initial)
# H. G. W. (last name is not a word)
# Herb. G. W. (dot only allowed after initial, not word)
# Rules
# Both initials and words must be capitalized.
# Initials must end with a dot.
# A name must be either 2 or 3 words long (depending on whether a middle name exists).
# If the name is 3 words long, you can expand the first and middle name or expand the
# first name only. You cannot keep the first name as an initial and expand the middle
# name only.
# The last name must be a word (not an initial).
# Your task is to write a function that determines whether a name is valid or not.
# Return true if the name is valid, false otherwise.



def valid_name(full_name)
  names = full_name.split

  if names.size < 2 ||
     (names[-1].size < 3 || names[-1][-1] == ".") ||
     names.select {|name| name.size == 1}.count > 0 ||
     names.select {|name| name[0] == name[0].downcase}.count > 0 ||
     (names.size > 2 && names[0].size == 2 && names[1].size > 2 && names[0][-1] == ".")
    return false
  end

  names
end

p valid_name("H. Wells") #== true
p valid_name("H. G. Wells") #== true
p valid_name("Herbert G. Wells") #== true
p valid_name("Herbert") #== false # Must be 2 or 3 words
p valid_name("h. Wells") #== false # Incorrect capitalization
p valid_name("H Wells") #== false # Missing dot after initial
p valid_name("H. George Wells") #== false # Cannot have: initial first name + word middle name
p valid_name("H. George W.") #== false # Last name cannot be initial