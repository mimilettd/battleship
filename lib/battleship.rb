require_relative 'standard_output'
require 'pry'

class Battleship
include StandardOutput
  def initialize
    welcome
  end

  def welcome
    welcome_player
    game_selection
    user_input = gets.chomp
    start_game_sequence(user_input)
  end

  def start_game_sequence(user_input)
    if user_input == "i"
      display_instructions
    elsif user_input == "q"
      quit
    elsif user_input == "p"
      play_game
    end
  end

  def display_instructions
    instructions
    game_selection
    user_input = gets.chomp
    start_game_sequence(user_input)
  end

end
