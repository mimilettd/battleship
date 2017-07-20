require_relative 'ship'
require 'pry'

class GameGrid
  attr_accessor :grid,
                :print_game_board,
                :ship
  def initialize
    @grid = {"A1" => ["     ", false],
             "A2" => ["     ", false],
             "A3" => ["     ", false],
             "A4" => ["     ", false],
             "B1" => ["     ", false],
             "B2" => ["     ", false],
             "B3" => ["     ", false],
             "B4" => ["     ", false],
             "C1" => ["     ", false],
             "C2" => ["     ", false],
             "C3" => ["     ", false],
             "C4" => ["     ", false],
             "D1" => ["     ", false],
             "D2" => ["     ", false],
             "D3" => ["     ", false],
             "D4" => ["     ", false] }
  end

  def print_game_board
    top_border    =  "==================="
    header        = [".", "  1  ", "  2  ", "  3  ", "  4  "].join
    a_row         = ["A", @grid["A1"][0], @grid["A2"][0], @grid["A3"][0], @grid["A4"][0]].join
    b_row         = ["B", @grid["B1"][0], @grid["B2"][0], @grid["B3"][0], @grid["B4"][0]].join
    c_row         = ["C", @grid["C1"][0], @grid["C2"][0], @grid["C3"][0], @grid["C4"][0]].join
    d_row         = ["D", @grid["D1"][0], @grid["D2"][0], @grid["D3"][0], @grid["D4"][0]].join
    bottom_border = "==================="
    print "\n#{top_border}\n#{header}\n#{a_row}\n#{b_row}\n#{c_row}\n#{d_row}\n#{bottom_border}\n\n"
  end

  def create_new_ship
    @ship = Ship.new
  end

  def space_1(coord)
    @ship.space_1(coord)
  end

  def space_2(coord)
    @ship.space_2(coord)
  end

  def space_3(coord)
    @ship.space_3(coord)
  end

  def damaged
    @ship.damaged
  end


end
