require 'pry'

class Battleship
  attr_reader :welcome,
              :instructions
  def initialize
    @welcome
  end

  def welcome
    welcome = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    puts welcome
    user_input = gets.chomp
    start_game_sequence(user_input)
  end

  def start_game_sequence(user_input)
    if user_input == "i"
      instructions
    elsif user_input == "q"
      quit
    elsif user_input == "p"
      #launch into play
    end
  end

  def instructions
    instructions = "\n\nOBJECTIVE:\n\nTo become the winner of Battleship you must be able to find (sink)\nall two ships in your opponent’s fleet before they sink yours.\n\nGAME PLAY:\n\nWhen the game starts, the computer player will already place their\nships on their game grid. You will be prompted to enter the start\nand end coordinates of your two-unit ship and then your three-unit\nship on your game grid. You and your opponent will then take turns\nentering a coordinate to fire on until either your's or your\nopponent's fleet have been sunk.\n\nRULES:\n\nNote that there are certain restrictions on where a ship can be\nplaced. Specifically:\n\n(1) Ships cannot wrap around the board\n(2) Ships cannot overlap\n(3) Ships can be laid either horizontally or vertically\n(4) Coordinates must correspond to the first and last units of the\nship. (IE: You can’t place a two unit ship at A1 A3).\n\n"
    puts instructions
  end

  def quit
    puts "Good choice! You would have lost if you played."
  end

end
