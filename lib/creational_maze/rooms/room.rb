module Rooms
  class Room < CreationalMaze::MapSite
    include Directions

    attr_accessor :sides
    attr_accessor :room_number

    def initialize(room_number)
      @room_number = room_number
      @sides = Hash.new
    end

    def enter; end

    def set_side(direction, map_site)
      raise ArgumentError unless all_directions.include?(direction)

      @sides[direction] = map_site
    end

    def get_direction(map_site)
    end
  end
end
