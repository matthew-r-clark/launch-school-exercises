# first attempt
# class TextAnalyzer
#   def process
#     File.open("analyze.txt") do |text|
#       puts yield(text)
#     end
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process do |text|
#   paragraphs = 1
#   text.each_line { |line| paragraphs += 1 if line == "\n" }
#   "#{paragraphs} paragraphs"
# end

# analyzer.process do |text|
#   lines = 0
#   text.each_line { lines += 1 }
#   "#{lines} lines"
# end

# analyzer.process do |text|
#   words = 0
#   text.each_line { |line| words += line.split.count }
#   "#{words} words"
# end


# ls solution
class TextAnalyzer
  def process
    file = File.open("analyze.txt", 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs"}
analyzer.process { |text| puts "#{text.split("\n").count} lines"}
analyzer.process { |text| puts "#{text.split.count} words"}