class CircularBuffer
  def initialize(size)
    @size = size
    clear
  end

  def write(data)
    raise BufferFullException if full?
    empty_index = @buffer.index(nil)
    @buffer[empty_index] = data
  end

  def write!(data)
    return data if data.nil?
    begin
      write(data)
    rescue BufferFullException
      @buffer.delete_at(0)
      @buffer << data
    end
  end

  def read
    raise BufferEmptyException if empty?
    @buffer << nil
    @buffer.shift
  end

  def clear
    @buffer = Array.new(@size)
  end

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  private

  def full?
    @buffer.none?(nil)
  end

  def empty?
    @buffer.all?(nil)
  end
end
