# Rules
# 1) Return true if player 1 or player 2 win the game.
# 2) Return false if nobody won the game.
# 3) Return "Nobody moved" if nobody made a move.
# 4) Return "No/Incomplete game" if no value was received / all received arrays are void / type of any given value is not "array".
# 5) Return "Corrupted game" if any values differ from the expected "X", "O", "-".

# Create array of all rows, columns, and diagonals.
# Cylce through these to see if any of them is all X or O.
# True if someone won, false if a tie.
# Check if no moves were made
# Check if incomplete game
# Check if corrupted game

def get_possible(rows)
  possible = []

  rows = rows.flatten.map {|str| str.chars}
  columns = rows[0].zip(*rows[1..2])

  possible << columns << rows
  possible = possible.flatten(1)

  # get diagnoals
  possible << [rows[0][0], rows[1][1], rows[2][2]]
  possible << [rows[0][2], rows[1][1], rows[2][0]]

  possible
end

def tic_tac_toe_check(rows)
  rows.flatten.each {|row| return "No/Incomplete game" if row != row.to_s}
  return "Nobody moved" if rows.flatten.all?("---")

  possible = get_possible(rows)

  win = false

  possible.each do |line|
    win = true if line.all?("X") || line.all?("O")
  end
  win
end

p tic_tac_toe_check([["XO-"], ["XXO"], ["O-X"]]) #== true
p tic_tac_toe_check([["XXO"], ["OOX"], ["XOO"]]) #== false
p tic_tac_toe_check([["---"], ["---"], ["---"]]) #== "Nobody moved"
p tic_tac_toe_check([[], [], []]) #== "No/Incomplete game"
p tic_tac_toe_check([[], []]) #== "No/Incomplete game"
p tic_tac_toe_check([1, ["XOX"], ["XOO"]]) #== "No/Incomplete game"
p tic_tac_toe_check(["XOX", ["XOX"], []]) #== "No/Incomplete game"
# p tic_tac_toe_check([["X"], ["XX"], ["X-"]]) #== "Corrupted game"
# p tic_tac_toe_check([["AAA"], ["BBA"], ["ABB"]]) #== "Corrupted game"
# p tic_tac_toe_check([["XOX"], ["XOO"], [undefined]]) #== "Corrupted game"
# p tic_tac_toe_check([["XXX"], ["XOX"], [""]]) #== "Corrupted game"
# p tic_tac_toe_check([["XXX"], ["XOX"], [1,2,3]]) #== "Corrupted game"