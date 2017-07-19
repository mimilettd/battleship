require 'pry'

class GameGrid
  attr_accessor :grid,
                :print_game_board
  def initialize
    @grid = {"A1" => "     ", "A2" => "     ", "A3" => "     ", "A4" => "     ",
             "B1" => "     ", "B2" => "     ", "B3" => "     ", "B4" => "     ",
             "C1" => "     ", "C2" => "     ", "C3" => "     ", "C4" => "     ",
             "D1" => "     ", "D2" => "     ", "D3" => "     ", "D4" => "     "}
  end

  def print_game_board
    top_border    =  "==========="
    header        = [".", "  1  ", "  2  ", "  3  ", "  4  "].join
    a_row         = ["A", @grid["A1"], @grid["A2"], @grid["A3"], @grid["A4"]].join
    b_row         = ["B", @grid["B1"], @grid["B2"], @grid["B3"], @grid["B4"]].join.center(5)
    c_row         = ["C", @grid["C1"], @grid["C2"], @grid["C3"], @grid["C4"]].join.center(5)
    d_row         = ["D", @grid["D1"], @grid["D2"], @grid["D3"], @grid["D4"]].join.center(5)
    bottom_border = "==========="
    print "#{top_border}\n#{header}\n#{a_row}\n#{b_row}\n#{c_row}\n#{d_row}\n#{bottom_border}\n\n"
  end
end
