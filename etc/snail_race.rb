# Steve and Maurice are racing snails. They each have three: 
# a fast one, a medium one, and a slow one. Steve and Maurice 
# plan to compete in three races. Each snail will only race once.

# Although Steve's snails are all a bit stronger than Maurice's, 
# Maurice has a trick up his sleeve. Maurice plans to sacrifice 
# his slowest snail against Steve's fastest snail, so that he 
# can use his medium snail against Steve's slowest snail and 
# his fastest snail against Steve's medium snail.

# Write a function that determines whether Maurice's plan will 
# work by outputting true if Maurice wins 2/3 games (he loses 
# the gme during which he sacrifices his slowest snail). 
# Maurice wins if his competing snail's speed strictly 
# exceeds Steve's competing snail's speed. The input consists 
# of two arrays: the first array are the speeds of Maurice's 
# slow, medium and fast snail; the second array are the speeds 
# of Steve's slow, medium, and fast snail.

# Two arrays, Maurices then Steve, both slow med, fast
# True/false whether or not maurice STRICTLY wins 2/3 times.



def maurice_wins(maurice, steve)
  score = 0

  # slow vs fast (Maurice vs Steve)
  score += 1 if maurice[0] > steve[2]

  # medium vs slow
  score += 1 if maurice[1] > steve[0]

  # fast vs medium
  score += 1 if maurice[2] > steve[1]

  score >= 2 ? true : false
end

p maurice_wins([3, 5, 10], [4, 7, 11]) #== true
# Since the matches are (3, 11), (5, 4) and (10, 7), Maurice wins 2 out of 3. 

p maurice_wins([6, 8, 9], [7, 12, 14]) #== false
# Since the matches are (6, 14), (8, 7) and (9, 12), Steve wins 2 out of 3. 

p maurice_wins([1, 8, 20], [2, 9, 100]) #== true

# Notes
# Ties in snail speeds are not counted as points for either 
# Steve or Maurice. Maurice's snail must be strictly faster 
# than Steve's snail to win.

# Steve is unaware of Maurice's plans and will always play 
# his fastest first, followed by his slowest and then his 
# medium snail.
