require "spec_helper"

RSpec.describe MazeGame do
  context "initialization" do
    it "provides a new maze" do
      maze_game = MazeGame.new
      maze = maze_game.maze

      expect(maze).to be_a(CreationalMaze::Maze)
    end
  end
end
