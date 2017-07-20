class Ship
  attr_reader   :fore,
                :hull,
                :aft
  attr_accessor :length,
                :damage,
                :sunk
  def initialize
    @length      = 0
    @fore        = nil
    @hull        = nil
    @aft         = nil
    @damage     = 0
    @sunk        = false
  end

  def damaged
    @damage += 1
    if @damage == @length
      @sunk = true
    end
  end

  def space_1(coord)
    @fore = coord
    @length += 1
  end

  def space_2(coord)
    @hull = coord
    @length += 1
  end

  def space_3(coord)
    @aft = coord
    @length += 1
  end

end
