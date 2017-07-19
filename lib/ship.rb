class Ship
  attr_reader   :bow,
                :rear
  attr_accessor :length,
                :damaged,
                :sunk
  def initialize
    @length      = 0
    @space_1     = nil
    @space_2     = nil
    @space_3     = nil
    @damaged     = 0
    @sunk        = false
  end

  def sunk?
    if @damaged == @length
      @sunk = true
    end
  end

  def damaged
    @damaged += 1
  end

  def length
    @length += 1
  end

  def space_1(coord)
    @space_1 = coord
    @length += 1
  end

  def space_2(coord)
    @space_2 = coord
    @length += 1
    binding.pry
  end

  def space_3(coord)
    @space_3 = coord
    @length += 1
    binding.pry
  end

end
