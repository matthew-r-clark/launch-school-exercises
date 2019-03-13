# Takes a String containing a first name, a space, and a last name.
# Returns a String that contains the last name, a comma, a space,
# and the first name.

def swap_name(full_name)
  first, last = full_name.split
  "#{last}, #{first}"

  # LS solution:
  # full_name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
p swap_name('Matt Clark') == 'Clark, Matt'
p swap_name('Lionel Polansky') == 'Polansky, Lionel'
