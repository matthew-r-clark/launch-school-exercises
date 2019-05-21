NUMS = {
  "one" => '1',
  "two" => '2',
  "three" => '3',
  "four" => '4',
  "five" => '5',
  "six" => '6',
  "seven" => '7',
  "eight" => '8',
  "nine" => '9',
  "zero" => '0'
}

# 1. first attempt
# def format_phone(text)
#   start, stop = nil
#   text.chars.each_with_index do |char, index|
#     if char =~ /\d/ && start
#       stop = index
#     elsif char =~ /\d/
#       start = index
#     end
#   end

#   text[start..stop] = add_special_chars(text[start..stop].delete(' '))

#   text
# end

# def add_special_chars(number)
#   number = number.to_i.digits.reverse

#   if number.size == 7
#     number.insert(3, "-")
#   elsif number.size == 10
#     number.insert(6, "-")
#     number.insert(3, ") ")
#     number.insert(0, "(")
#   else
#     number
#   end

#   number.join
# end

# def word_to_digit(text)
#   NUMS.each do |key, val|
#     text.gsub!(/\b#{key}\b/, val)
#   end
#   text = format_phone(text)
# end


# 2. second attempt
def format_number(number, num_digits)
  case num_digits
  when 7
    number.insert(3, "-")
  when 10
    number.insert(6, "-")
    number.insert(3, ")")
    number.insert(0, "(")
  when 11
    number.insert(7, "-")
    number.insert(4, ")")
    number.insert(1, "(")
  else
    raise "Invalid phone number: #{number.join}."
  end
  number.join
end

def word_to_digit(text)
  array = text.split
  array = array.map do |item|
    if NUMS.keys.include?(item)
      NUMS[item]
    elsif NUMS.keys.include?(item.gsub(/[^a-zA-Z]/, ''))
      NUMS[item[0...-1]] + item[-1]
    else
      item
    end
  end
  indices = []
  array.each_with_index {|e, i| indices << i if e[0].to_i.to_s == e[0]}
  num_digits = indices.size
  number = array[indices.first..indices.last]
  formatted_num = format_number(number, num_digits)
  num_digits.times {array.delete_at(indices.first)}
  array.insert(indices.first, formatted_num)
  array.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('Call me: eight one seven nine nine two three nine eight seven.')
p word_to_digit('Shoot me a text at one eight zero zero four five seven three nine nine five')
p word_to_digit('Text me: six seven nine zero eight.')