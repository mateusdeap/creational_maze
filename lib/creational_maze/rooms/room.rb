module Rooms
  class Room < CreationalMaze::MapSite
    include Directions
    attr_accessor :sides

    def initialize(room_number)
      @room_number = room_number
      @sides = Hash.new
    end

    def enter; end

      sides[direction] = map_site
    end

      sides[direction]
    def get_direction(map_site)
    end
  end
end
