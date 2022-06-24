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

      sides[direction] = map_site
    end

      sides[direction]
    def get_direction(map_site)
    end
  end
end
