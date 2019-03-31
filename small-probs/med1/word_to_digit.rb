NUMS = {
  "one" => '1',
  "two" => '2',
  "three" => '3',
  "four" => '4',
  "five" => '5',
  "six" => '6',
  "seven" => '7',
  "eight" => '8',
  "nine" => '9'
}

def format_phone(text)
  start, stop = nil
  text.chars.each_with_index do |char, index|
    if char =~ /\d/ && start
      stop = index
    elsif char =~ /\d/
      start = index
    end
  end

  text[start..stop] = add_special_chars(text[start..stop].delete(' '))

  text
end

def add_special_chars(number)
  number = number.to_i.digits.reverse

  if number.size == 7
    number.insert(3, "-")
  elsif number.size == 10
    number.insert(6, "-")
    number.insert(3, ") ")
    number.insert(0, "(")
  else
    number
  end

  number.join
end

def word_to_digit(text)
  NUMS.each do |key, val|
    text.gsub!(/\b#{key}\b/, val)
  end
  text = format_phone(text)
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('Call me: eight one seven nine nine two three nine eight seven.')