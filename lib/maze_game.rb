class MazeGame
  include CreationalMaze

  attr_accessor :maze

  def initialize
    builder = Builders::RandomMazeBuilder.new
    @maze = new_maze(builder)
  end
end
