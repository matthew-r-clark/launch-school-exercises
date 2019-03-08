# Write a method that will take a short line of text,
# and print it within a box.

# Example output:
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# Data structure: Build strings to hold box lines, based on input size.

# Determine number of text lines are needed to fit within 76 chars
# Divide string into lines and add to array
# Determine width of box
# Iterate through array to display text within box

def split_text(text, lines) # takes in string, returns array of strings
  array = []
  if text.size < 76
    array << text
  else
    lines.times do
      array << text[0..75]
      text = text[76..-1]
    end
  end
  array
end

def print_in_box(text)
  lines_of_text = text.size / 76 + 1
  text = split_text(text, lines_of_text)
  width = text[0].size + 2
  outer_rows = "+#{"-" * width}+"
  inner_rows = "|#{" " * width}|"

  puts outer_rows
  puts inner_rows
  text.each {|line| puts "| #{line}#{" " * (width - line.size - 2)} |"}
  puts inner_rows
  puts outer_rows
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('My name is Matt!')
print_in_box("This is an example of a message that will need to be on two different lines. Let's see what happens!")
print_in_box('Mauris nec elit dignissim libero ullamcorper congue. Sed neque diam, sagittis eget ultrices in, rutrum sed enim. Nunc porta erat tristique felis laoreet laoreet. Aliquam luctus nunc at lectus hendrerit, vel venenatis turpis faucibus. Phasellus eget urna arcu. Aliquam condimentum quis lorem ut ullamcorper. Mauris tempus lectus sed nunc posuere, sed placerat nulla laoreet. Nullam rhoncus arcu sit amet ipsum mollis imperdiet. Suspendisse quis fringilla ante, tempor pharetra enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam aliquet, dui sed pharetra iaculis, justo augue auctor elit, sit amet luctus magna tortor ac mi. Mauris sollicitudin magna sit amet mauris iaculis feugiat. Ut viverra eros ut nunc fermentum, sit amet fringilla orci elementum. Suspendisse sagittis justo sit amet posuere accumsan.')
