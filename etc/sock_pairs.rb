def sock_pairs(socks)
  socks = socks.chars.group_by(&:itself)

  pairs = 0

  socks.values.each {|e| pairs += e.count / 2}

  pairs
end

p sock_pairs("AA") # == 1
p sock_pairs("ABABC") # == 2
p sock_pairs("CABBACCC") # == 4
p sock_pairs("AACDE") # == 1
p sock_pairs("ACDBE") # == 0
p sock_pairs("") # == 0
p sock_pairs("ABABAB") # == 2
p sock_pairs("AAAAA") # == 2
p sock_pairs("AAACCBB") # == 3