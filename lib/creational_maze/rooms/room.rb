module Rooms
  class Room < CreationalMaze::MapSite
    def initialize(room_number:)
      @room_number = room_number
    end

    def enter; end

    def set_side(direction:, map_site:); end

    def get_side(direction:); end
  end
end
