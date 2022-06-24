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

    def get_side(direction)
      @sides[direction]
    end

    def get_doors
      @sides.select {|side, map_site| map_site.is_a?(Doors::Door)}
            .map {|side, door| door}
    end

    def get_direction(map_site)
      @sides.select {|side, this_map_site| map_site.equal?(this_map_site)}
            .keys.first
    end
  end
end
