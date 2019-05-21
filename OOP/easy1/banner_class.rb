class Banner
  def initialize(message, size=message.size + 2)
    @message = message
    @size = size
  end

  def to_s
    return "Unable to display banner." if size < message.size
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :size

  def horizontal_rule
    "+#{"-" * (size)}+"
  end

  def empty_line
    "|#{" " * (size)}|"
  end

  def message_line
    "|#{message.center(size)}|"
  end
end


banner = Banner.new('To boldly go where no one has gone before.')
puts banner
#     +--------------------------------------------+
#     |                                            |
#     | To boldly go where no one has gone before. |
#     |                                            |
#     +--------------------------------------------+

banner = Banner.new('', 5)
puts banner
#     +-----+
#     |     |
#     |     |
#     |     |
#     +-----+

banner = Banner.new('Matthew', 5)
puts banner
# Unable to display banner.