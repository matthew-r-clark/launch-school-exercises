# def circle(diameter)


#   diameter.times do |line|
#     case line
#     when 0, (diameter-1)      then puts "#{" " * (diameter)}*"
#     when (diameter/2) then puts "*#{" " * (diameter * 2)}*"
#     else                           puts ""
#     end
#   end
# end


# Contributed by Rob Taylor at Launch School
def circle(r)
  h = k = r
  (r * 2).downto(0) do |y|
    row = ''
    0.upto(r * 2) do |x|
      if (x - h)**2 + (y - k)**2 <= r**2
        row += ' *'
      else
        row += '  '
      end
    end
    puts row
  end
end

circle(20)