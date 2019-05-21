class Person
  def laugh
    puts laugh_sound
  end

  def laugh_sound
    "Bw"
  end
end

class Dad < Person
  def laugh_sound
    super + 'hahaha'
  end

  def self.print_self
    puts self
  end
end

gary = Dad.new
gary.laugh