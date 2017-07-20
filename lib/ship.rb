class Ship
  attr_reader   :fore,
                :hull,
                :aft
  attr_accessor :length,
                :damaged,
                :sunk
  def initialize
    @length      = 0
    @fore        = nil
    @hull        = nil
    @aft         = nil
    @damaged     = 0
    @sunk        = false
  end

  # def sunk?
  #   if @damaged == @length
  #     @sunk = true
  #   end
  # end

  def damaged
    @damaged += 1
    if @damaged == @length
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
