module CreationalMaze
  class EnchantedMazeFactory
    def make_maze
      Maze.new
    end

    def make_wall
      Walls::Wall.new
    end

    def make_room(room_number:)
      Rooms::EnchantedRoom.new room_number: room_number
    end

    def make_door(room_1:, room_2:)
      Door.new room_1: room_1, room_2: room_2
    end

    def cast_spell; end
  end
end
