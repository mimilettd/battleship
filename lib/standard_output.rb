module StandardOutput

  def welcome_player
    puts "Welcome to BATTLESHIP\n\n"
  end

  def game_selection
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    puts "\n\nOBJECTIVE:\n\nTo become the winner of Battleship you must be able to find (sink)\nall two ships in your opponent’s fleet before they sink yours.\n\nGAME PLAY:\n\nWhen the game starts, the computer player will already place their\nships on their game grid. You will be prompted to enter the start\nand end coordinates of your two-unit ship and then your three-unit\nship on your game grid. You and your opponent will then take turns\nentering a coordinate to fire on until either your's or your\nopponent's fleet have been sunk.\n\nRULES:\n\nNote that there are certain restrictions on where a ship can be\nplaced. Specifically:\n\n(1) Ships cannot wrap around the board\n(2) Ships cannot overlap\n(3) Ships can be laid either horizontally or vertically\n(4) Coordinates must correspond to the first and last units of the\nship. (IE: You can’t place a two unit ship at A1 A3).\n\n"
  end

  def quit
    puts "\n\nGood choice! You would have lost if you played."
  end

  def enter_two_unit_ship_placement
    puts "\n\nI have laid out my ships on the grid. You now need to layout\nyour two ships. The first is two units long and the second\nis three units long. The grid has A1 at the top left and D4\nat the bottom right.\n\nEnter the squares for the two-unit ship:\n\n"
  end

  def enter_three_unit_ship_placement
    puts "\n\nYour two-unit ship has been placed. Now enter the start and\nend square for the three-unit ship:\n\n"
  end

  def incorrect_ship_placement_for_two_unit_ship
    puts "\n\nIncorrect ship placement. Please enter the squares for the\ntwo-unit ship again:\n\n"
  end

  def ships_cannot_overlap
    puts "\n\nShips cannot overlap. Please enter your coordinates again:\n\n"
  end

  def incorrect_ship_placement_for_three_unit_ship
    puts "\n\nIncorrect ship placement. Please enter the squares for the\nthree-unit ship again:\n\n"
  end

  def your_turn
    puts "IT'S YOUR TURN:"
  end

  def choose_a_position_to_fire
    puts "Choose a square you would like to fire. Good luck!\n\n"
  end

  def you_missed
    puts "Hah! You missed!\n\n"
  end

  def you_hit
    puts "You hit my ship!\n"
  end

  def hit_enter_to_end_turn
    puts "Now end you turn by pressing ENTER."
  end

  def my_turn
    puts "\n\nIT'S MY TURN:"
  end

  def i_hit
    puts "I hit your ship!\n"
  end

  def i_missed
    puts "I missed...\n\n"
  end

  def you_sank_my_two_unit_ship
    puts "How dare you sink my two-unit ship!\n\n"
  end

  def you_sank_my_three_unit_ship
    puts "How dare you sink my three-unit ship!\n\n"
  end

  def i_sank_your_two_unit_ship
    puts "Hah! I sank your two-unit ship!\n\n"
  end

  def i_sank_your_three_unit_ship
    puts "Hah! I sank your three-unit ship!\n\n"
  end

  def human_won
    puts "Congratulations! You won. Do you feel good about yourself?\n\n"
  end

  def computer_won
    puts "I told you I would win!\n\n"
  end

end
