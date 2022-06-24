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
  NUMBER_OF_ROOMS = 25

  def new_maze(maze_builder)
    maze_builder.build_maze

    for room_number in 1..NUMBER_OF_ROOMS do
      maze_builder.build_room room_number
    end

    maze_builder.get_maze
  end
end
