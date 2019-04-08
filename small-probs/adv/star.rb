# Prints an 8-pointed star of size n x n
# n being 7 or greater, and always odd

# create each row using 'outer' and 'inner' spacer variables
# increment/decrement variables until on middle row
# create middle row, then reverse decrement/increment variables
# to create bottom half of star

def star(n)
  outer = 0
  inner = (n-3) / 2

  loop do # create top
    puts "#{" " * outer}*#{" " * inner}*#{" " * inner}*#{" " * outer}"
    break if inner == 0
    outer += 1
    inner -= 1
  end

  puts "*" * n

  loop do # create bottom
    puts "#{" " * outer}*#{" " * inner}*#{" " * inner}*#{" " * outer}"
    break if outer == 0
    outer -= 1
    inner += 1
  end
  puts ""
end

star(7)
star(9)
star(21)