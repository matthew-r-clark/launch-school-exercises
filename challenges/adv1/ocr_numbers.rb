class OCR
  def initialize(ocr)
    @ocr = ocr
  end

  def convert
    if @ocr.size <= 12
      convert_individual(@ocr)
    elsif @ocr.include?("\n\n")
      convert_multiple_lines
    else
      convert_multiple_digits(@ocr)
    end
  end

  def append_spaces(line)
    spaces = " " * (3 - (line.size % 3))
    line + spaces
  end

  def convert_individual(text)
    case
    when /^ _ ?[\n]\| \|[\n]\|_\|[\n]$/  =~ text then "0"
    when /^ {0,3}[\n]  \|[\n]  \|[\n]$/  =~ text then "1"
    when /^ _ ?[\n] _\|[\n]\|_ ?[\n]$/   =~ text then "2"
    when /^ _ ?[\n] _\|[\n] _\|[\n]$/    =~ text then "3"
    when /^ {0,3}[\n]\|_\|[\n]  \|[\n]$/ =~ text then "4"
    when /^ _ ?[\n]\|_ ?[\n] _\|[\n]$/   =~ text then "5"
    when /^ _ ?[\n]\|_ ?[\n]\|_\|[\n]$/  =~ text then "6"
    when /^ _ ?[\n]  \|[\n]  \|[\n]$/    =~ text then "7"
    when /^ _ ?[\n]\|_\|[\n]\|_\|[\n]$/  =~ text then "8"
    when /^ _ ?[\n]\|_\|[\n] _\|[\n]$/   =~ text then "9"
    else                                              "?"
    end
  end

  def convert_multiple_digits(text)
    lines_array = text.split("\n")
    num_digits = (lines_array.first.size / 3.0).ceil
    digits = Array.new(num_digits, "")

    lines_array.each do |line|
      line = append_spaces(line)

      index = -3
      digits.map! do |digit|
        index += 3
        digit += line[index..index+2] + "\n"
      end
    end

    digits.map {|digit| convert_individual(digit)}.join
  end

  def convert_multiple_lines
    @ocr.split("\n\n")
      .map {|number| convert_multiple_digits(number)}
      .join(",")
  end
end