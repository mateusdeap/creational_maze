# frozen_string_literal: true

require "creational_maze/version"
require "creational_maze/maze"
require "creational_maze/rooms"
require "creational_maze/directions"
require "creational_maze/doors"
require "creational_maze/walls"
require "creational_maze/error"
require "creational_maze/builders"
require "creational_maze/factories"

module CreationalMaze
  NUMBER_OF_ROOMS = 6

  def new_maze(maze_builder)
    maze_builder.build_maze

    (1..NUMBER_OF_ROOMS).each do |room_number|
      maze_builder.build_room room_number
    end

    rooms = maze_builder.get_maze.rooms

    rooms.each do |room|
      room.sides.each do |_direction, _map_site|
        door_odds = rand
        if door_odds >= 0.5
          room2 = rooms.sample
          maze_builder.build_door(room.room_number, room2.room_number)
        end
      end
    end

    maze_builder.get_maze
  end
end
