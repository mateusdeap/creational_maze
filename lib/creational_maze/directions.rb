module Directions
  NORTH = :north
  SOUTH = :south
  EAST = :east
  WEST = :west

  def all_directions
    %i[north south east west]
  end

  def opposite_direction(direction)
    case direction
    when :south
      :north
    when :east
      :west
    when :west
      :east
    when :north
      :south
    else
      raise ArgumentError, "The only valid directions are :north, :south, :east or :west"
    end
  end
end
