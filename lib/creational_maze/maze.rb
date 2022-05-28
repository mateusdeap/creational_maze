module CreationalMaze
  class Maze
    attr_accessor :rooms

    def initialize
      @rooms = []
    end

    def enter
    end

    def add_room(room:)
      @rooms.push room
    end

    def room_no(room_number:)
    end
  end
end
