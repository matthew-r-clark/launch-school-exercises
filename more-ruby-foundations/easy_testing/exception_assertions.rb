# Write a minitest assertion that will fail unless employee.hire
# raises a NoExperienceError exception.

assert_raise(NoExperienceError) { employee.hire }