# Takes in three scores, returns a letter grade based on the average of
# the three scores passed in.

# Determine average score, use case statement to return letter grade.

def get_grade(*grades)
  avg_score = grades.reduce(&:+) / grades.size
  letter_grade(avg_score)
end

def letter_grade(avg)
  case avg
  when (100..)
    "A+"
  when (90..100)
    "A"
  when (80...90)
    "B"
  when (70...80)
    "C"
  when (60...70)
    "D"
  when (0...60)
    "F"
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(101, 110, 99) == "A+"
