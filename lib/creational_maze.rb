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

  def self.new_maze(maze_factory:)
    maze = maze_factory.make_maze
    r1 = maze_factory.make_room room_number: 1
    r2 = maze_factory.make_room room_number: 2
    the_door = maze_factory.make_door room_1: r1, room_2: r2

    maze.add_room room: r1
    maze.add_room room: r2

    r1.set_side direction: DIRECTIONS[:north], map_site: maze_factory.make_wall 
    r1.set_side direction: DIRECTIONS[:east], map_site: the_door
    r1.set_side direction: DIRECTIONS[:south], map_site: maze_factory.make_wall
    r1.set_side direction: DIRECTIONS[:west], map_site: maze_factory.make_wall


    r2.set_side direction: DIRECTIONS[:north], map_site: maze_factory.make_wall
    r2.set_side direction: DIRECTIONS[:east], map_site: maze_factory.make_wall
    r2.set_side direction: DIRECTIONS[:south], map_site: maze_factory.make_wall
    r2.set_side direction: DIRECTIONS[:west], map_site: the_door

    maze
  end

  def self.new_level
    bombed_maze_factory = BombedMazeFactory.new
    enchanted_maze_factory = EnchantedMazeFactory.new
    maze_factory_array = [bombed_maze_factory, enchanted_maze_factory]

    new_maze(maze_factory: maze_factory_array.sample)
  end
end
