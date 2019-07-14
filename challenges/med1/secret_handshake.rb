class SecretHandshake
  OPS = {
    1 => 'wink',
    10 => 'double blink',
    100 => 'close your eyes',
    1000 => 'jump',
    10000 => nil
  }

  def initialize(input)
    @binary = process(input)
  end

  def process(input)
    case input
    when Integer then input.to_s(2).to_i
    when String  then input.to_i
    else         raise TypeError
    end
  end

  def command_list
    list = compile_list
    list.reverse! if list.delete(10000)
    list
  end

  def compile_list
    current = @binary
    list = []
    OPS.keys.reverse.each do |code|
      quantity, current = current.divmod(code)
      quantity.times { list << code }
    end
    list.reverse
  end

  def commands
    command_list.map { |code| OPS[code] }
  end
end
