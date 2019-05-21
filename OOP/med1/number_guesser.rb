class GuessingGame
  MAX_GUESSES = 7
  RANGE = 1..100

  def initialize
    @win_msg = "You won!"
  end

  def prompt(message)
    puts "=> #{message}"
  end

  def play
    secret_num = RANGE.to_a.sample
    guesses_remaining = MAX_GUESSES
    win_message = @win_msg
    guess = nil
    loop do
      puts ""
      prompt "You have #{guesses_remaining} guesses remaining."
      loop do
        prompt "Enter a number between #{RANGE.first} and #{RANGE.last}: "
        guess = gets.chomp.to_i
        if valid_guess?(guess)
          break
        else
          prompt "Invalid guess."
        end
      end
      guesses_remaining -= 1
      win_message = "You have no more guesses. You lost!" if guesses_remaining == 0
      prompt guess_response(guess, secret_num)

      if correct_guess?(guess, secret_num) || guesses_remaining == 0
        prompt win_message
        break
      end
    end
  end

  def valid_guess?(guess)
    guess.class == Integer && guess >= RANGE.first && guess <= RANGE.last
  end

  def correct_guess?(guess, secret_num)
    guess == secret_num
  end

  def guess_response(guess, secret_num)
    if guess > secret_num
      "Your guess is too high."
    elsif guess < secret_num
      "Your guess is too low."
    else
      "That's the number!"
    end
  end
end

game = GuessingGame.new
game.play
game.play