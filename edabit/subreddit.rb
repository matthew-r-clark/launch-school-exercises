
def sub_reddit(url)
  url.split("/")[-1]
end

p sub_reddit("https://www.reddit.com/r/relationships/") #== "relationships"
p sub_reddit("https://www.reddit.com/r/mildlyinteresting/") #== "mildlyinteresting"
p sub_reddit("https://www.reddit.com/r/funny/") #== "funny"