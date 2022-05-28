# frozen_string_literal: true

require "creational_maze/version"
require "creational_maze/maze"
require "creational_maze/rooms"
require "creational_maze/doors/door"
require "creational_maze/walls"
require "creational_maze/factories/bombed_maze_factory"
require "creational_maze/factories/enchanted_maze_factory"

module CreationalMaze
  DIRECTIONS = {
    north: 1,
    east: 2,
    west: 3,
    south: 4
  }

  NUMBER_OF_ROOMS = 10

  def self.new_maze(maze_factory:)
    maze = maze_factory.make_maze

    rooms = []
    for i in 1..NUMBER_OF_ROOMS do
      rooms.push maze_factory.make_room room_number: i
    end

    rooms.each do |room|
      maze.add_room room: room
    end

    maze.rooms.each do |room|
      DIRECTIONS.each do |direction|
        # randomely choose if make wall or add door
        wall = rand >= 0.5
        map_site = if wall
          maze_factory.make_wall
        else
          maze_factory.make_door room_1: room, room_2: rooms.sample
        end
        
        room.set_side direction: direction, map_site: map_site
      end
    end

    maze
  end

  def self.new_level
    bombed_maze_factory = BombedMazeFactory.new
    enchanted_maze_factory = EnchantedMazeFactory.new
    maze_factory_array = [bombed_maze_factory, enchanted_maze_factory]

    new_maze(maze_factory: maze_factory_array.sample)
  end
end
