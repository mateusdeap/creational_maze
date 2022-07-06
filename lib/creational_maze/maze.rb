module CreationalMaze
  class Maze
    attr_accessor :rooms_hash

    def initialize
      @rooms_hash = {}
    end

    def enter; end

    def add_room(room)
      @rooms_hash[room.room_number] = room
    end

    def room_no(room_number)
      @rooms_hash[room_number]
    end

    def rooms
      @rooms_hash.values
    end
  end
end
