class School
  def initialize
    @grades = {}
  end

  def add(name, grade)
    if @grades[grade]
      @grades[grade] << name
      @grades[grade].sort!
    else
      @grades[grade] = [name]
    end
    sort!
  end

  def sort!
    @grades = @grades.sort.to_h
  end

  def grade(n)
    @grades[n] ? @grades[n] : []
  end

  def to_h
    @grades
  end
end
