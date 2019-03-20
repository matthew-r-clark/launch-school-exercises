# Write a function that reverses characters in (possibly nested) parentheses in the input string.

# Input strings will always be well-formed with matching `()`s.

# Example

# - For `inputString = "(bar)"`, the output should be
#    `reverseInParentheses("(bar)") = "rab"`;
# - For `inputString = "foo(bar)baz"`, the output should be
#    `reverseInParentheses("foo(bar)baz") = "foorabbaz"`;
# - For `inputString = "foo(bar)baz(blim)"`, the output should be
#    `reverseInParentheses("foo(bar)baz(blim)") = "foorabbazmilb"`;
# - For `inputString = "foo(bar(baz))blim"`, the output should be
#    `reverseInParentheses("foo(bar(baz))blim") = "foobazrabblim"`.
#    Because `"foo(bar(baz))blim"` becomes `"foo(barzab)blim"` and then `"foobazrabblim"`.

# find anything within parenthesis, select it, reverse it, return it without parentheses
# if no parenthesis, return string

def reverseInParentheses(str)
  return str if !str.include?("(")

  pairs = str.count("(")
  left = nil

  str.chars.each_with_index do |char, index|
    if char == "("
      pairs -= 1
      if pairs == 0
        left = index
      end
    end
  end

  right = str[left..-1].index(")") + left

  str[left..right] = str[(left + 1)..(right - 1)].reverse

  reverseInParentheses(str)
end


# # Faouzi's solution:
# def reverseInParentheses(s)
#   stack = []
#   word = ''
#   s.chars.each do |c|
#     if c == '('
#       stack.push word
#       word = ''
#     elsif c == ')'
#       word = stack.pop + word.reverse
#     else
#       word += c
#     end
#   end
#   word
# end

p reverseInParentheses("(bar)") == "rab"
p reverseInParentheses("foo(bar)baz") == "foorabbaz"
p reverseInParentheses("foo(bar)baz(blim)") == "foorabbazmilb"
p reverseInParentheses("foo(bar(baz))blim") == "foobazrabblim"