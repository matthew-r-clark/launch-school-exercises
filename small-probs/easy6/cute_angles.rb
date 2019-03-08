# Take in degrees as a Float, output degrees, minutes, seconds as a String

# If degrees are an Integer, minutes and seconds will both be 0.
# Take remainder of dividing by 1 to get minutes.
# Same with minutes to get seconds.
# Format each and output string.

DEGREE = "\xC2\xB0"

def dms(degrees)
  degs = degrees.to_i
  mins = (degrees % 1) * 60
  secs = (mins % 1) * 60
  mins = mins / 1
  secs = secs / 1
  puts "#{degs}#{DEGREE}%02d'%02d\"" % [mins, secs]
end

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
