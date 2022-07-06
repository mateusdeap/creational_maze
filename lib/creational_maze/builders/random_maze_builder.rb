module Builders
  class RandomMazeBuilder
    include Directions

    attr_accessor :current_maze, :factories

    def initialize
      @factories = [
        Factories::BombedMazeFactory.new,
        Factories::EnchantedMazeFactory.new
      ]
    end

    def build_maze
      @current_maze = CreationalMaze::Maze.new
    end

    def build_room(room_no)
      raise Errors::InvalidStateError, "Can't build a room without a maze!" if @current_maze.nil?

      return unless @current_maze.room_no(room_no).nil?

      factory = @factories.sample
      room = factory.make_room(room_no)

      factory = @factories.sample
      room.set_side(Directions::NORTH, factory.make_wall)
      room.set_side(Directions::SOUTH, factory.make_wall)
      room.set_side(Directions::EAST, factory.make_wall)
      room.set_side(Directions::WEST, factory.make_wall)

      @current_maze.add_room(room)
    end

    def build_door(from_no, to_no)
      if @current_maze.nil? || @current_maze.rooms.empty?
        raise Errors::InvalidStateError, "Can't build a door without a maze! Call build_maze first."
      end

      room1 = @current_maze.room_no(from_no)
      room2 = @current_maze.room_no(to_no)
      door = Doors::Door.new(room1, room2)

      door_direction = all_directions.sample

      room1.set_side(door_direction, door)
      room2.set_side(opposite_direction(door_direction), door)
    end

    def get_maze
      @current_maze
    end
  end
end
