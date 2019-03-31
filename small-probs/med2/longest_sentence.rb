
def longest_sentence(filename)
  text = ""
  File.open(filename).each {|line| text << line}
  text = text.gsub("\n", " ").split(/[?!.]/)
  longest = []
  text.each do |sentence|
    longest = sentence.split if sentence.split.size > longest.size
  end
  "The longest sentence is:\n\n#{longest.join(" ")}.\n\nIt has #{longest.size} words."
end

puts longest_sentence("frankenstein.txt")