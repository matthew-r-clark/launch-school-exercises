# parse data
# calc
# print

def calc_range(stats)
  stats.max - stats.min
end

def calc_average(stats)
  stats.reduce(:+) / stats.size
end

def calc_median(stats)
  stats = stats.sort
  middle = stats.size / 2
  if stats.size.odd?
    stats[middle]
  else
    (stats[middle-1] + stats[middle]) / 2
  end
end

def convert_to_seconds(stats)
  stats = stats.split(", ").each_with_object([]) do |stat, arr|
    arr << stat.split("|").map {|num| num.to_i}
  end
  stats.map {|stat| stat[0]*60*60 + stat[1]*60 + stat[2]}
end

def format_hms(stat)
  minutes, seconds = stat.divmod(60)
  hours, minutes = minutes.divmod(60)
  "#{sprintf("%02d", hours)}|#{sprintf("%02d", minutes)}|#{sprintf("%02d", seconds)}"
end

def calc_stats(stats)
  return stats if stats == ""
  stats = convert_to_seconds(stats)

  range = calc_range(stats)
  average = calc_average(stats)
  median = calc_median(stats)

  "Range: #{format_hms(range)} Average: #{format_hms(average)} Median: #{format_hms(median)}"
end

p calc_stats("01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17") #== "Range: 00|47|18 Average: 01|35|15 Median: 01|32|34"