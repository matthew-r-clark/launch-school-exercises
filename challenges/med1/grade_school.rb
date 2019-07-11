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

# Methods:
# add # sort after adding grades?
# to_h # sort when getting grades?
# grade

school = School.new
school.add("Matt", 100)
p school
school.add("Dani", 100)
p school
school.add("Ginger", 95)
p school.to_h
p school.grade(100)