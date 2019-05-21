class GuessingGame

  def initialize(first, last)
    @range = first..last
    @max_guesses = Math.log2(last - first + 1).to_i + 1
  end

  def play
    secret_num = rand(@range)
    guesses_remaining = @max_guesses
    @win_msg = "You have no more guesses. You lost!"
    guess = nil
    loop do
      puts "You have #{guesses_remaining} guesses remaining."
      loop do
        print "Enter a number between #{@range.first} and #{@range.last}: "
        guess = gets.chomp.to_i
        if valid_guess?(guess)
          break
        else
          print "Invalid guess."
        end
      end
      guesses_remaining -= 1
      guess_response(guess, secret_num)

      if correct_guess?(guess, secret_num) || guesses_remaining == 0
        puts @win_msg, ""
        break
      end
    end
  end

  def valid_guess?(guess)
    guess.class == Integer && guess >= @range.first && guess <= @range.last
  end

  def correct_guess?(guess, secret_num)
    guess == secret_num
  end

  def guess_response(guess, secret_num)
    if guess > secret_num
      puts "Your guess is too high.", ""
    elsif guess < secret_num
      puts "Your guess is too low.", ""
    else
      @win_msg = "You won!", ""
      puts "That's the number!", ""
    end
  end
end

game = GuessingGame.new(1,100)
game.play
game.play