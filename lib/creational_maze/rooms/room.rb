module Rooms
  class Room < CreationalMaze::MapSite
    attr_accessor :sides

    def initialize(room_number:)
      @room_number = room_number
      @sides = Hash.new
    end

    def enter; end

    def set_side(direction:, map_site:)
      sides[direction] = map_site
    end

    def get_side(direction:)
      sides[direction]
    end
  end
end
