module VerseTypes
  class DefaultVerse
    def verse(n)
      "#{n} bottles of beer on the wall, #{n} bottles of beer.\n" \
      "Take one down and pass it around, " \
      "#{n - 1} bottles of beer on the wall.\n"
    end
  end

  class ZeroVerse
    def verse(_)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  class OneVerse
    def verse(_)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class TwoVerse
    def verse(_)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end
end

class BeerSong
  include VerseTypes

  VERSES = Hash.new(DefaultVerse)
               .merge({
                        0 => ZeroVerse,
                        1 => OneVerse,
                        2 => TwoVerse
                      })

  def verse(n)
    VERSES[n].new.verse(n)
  end

  def verses(start, stop)
    start.downto(stop).map { |n| verse(n) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
