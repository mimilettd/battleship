require_relative 'standard_output'
require_relative 'computer'
require_relative 'player'
require 'pry'

class Battleship
include StandardOutput
  attr_reader   :computer_player,
                :human_player,
                :start,
                :finish
  def initialize
    welcome
    @start = 0
    @finish = 0
  end

  def welcome
    welcome_player
    game_selection
    user_input = gets.chomp.downcase
    start_game_sequence(user_input)
  end

  def start_game_sequence(user_input)
    if user_input == "i"
      display_instructions
    elsif user_input == "q"
      quit_game
    elsif user_input == "p"
      @start = Time.now
      play_game
    end
  end

  def display_instructions
    instructions
    game_selection
    user_input = gets.chomp.upcase
    start_game_sequence(user_input)
  end

  def quit_game
    quit
    exit
  end

  def play_game
    @computer_player = Computer.new
    @human_player = Player.new
    place_two_unit_ship
  end

  def place_two_unit_ship
    enter_two_unit_ship_placement
    user_input = gets.chomp.upcase
    split_user_input = user_input.split(" ")
    human_player.two_unit_ship_position(split_user_input)
    place_three_unit_ship
  end

  def place_three_unit_ship
    enter_three_unit_ship_placement
    user_input = gets.chomp.upcase
    split_user_input = user_input.split(" ")
    human_player.three_unit_ship_position(split_user_input)
    initiate_player_shot_sequence
  end

  def initiate_player_shot_sequence
    if @computer_player.lose == true
      end_game_sequence
    else
      computer_player.computer_player.print_game_board
      your_turn
      choose_a_position_to_fire
      user_input = gets.chomp.upcase
      computer_player.verify_coordinate(user_input)
      hit_enter
    end
  end

  def hit_enter
    hit_enter_to_end_turn
    user_input = gets
    if user_input == "\n"
      initiate_computer_shot_sequence
    else
      you_did_not_hit_enter
      initiate_computer_shot_sequence
    end
  end

  def initiate_computer_shot_sequence
    if @human_player.lose == true
      end_game_sequence
    else
      my_turn
      human_player.verify_coordinate
      human_player.human_player.print_game_board
      initiate_player_shot_sequence
    end
  end

  def end_game_sequence
    if @computer_player.lose == true
      computer_player.computer_player.print_game_board
      human_won
      @finish = Time.now
      puts "It took you #{@computer_player.shot} shots to sink your opponent's ships."
      puts "The total time that the game took to play was #{@finish - @start} seconds."
      exit
    else
      human_player.human_player.print_game_board
      computer_won
      @finish = Time.now
      puts "It took your opponent #{@human_player.shot} shots to sink your ships."
      puts "The total time that the game took to play was #{@finish - @start} seconds."
      exit
    end
  end

end

battleship = Battleship.new
battleship.welcome
