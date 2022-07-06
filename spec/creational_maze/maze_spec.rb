require "spec_helper"

RSpec.describe CreationalMaze::Maze do
  describe "#add_room" do
    it "does not allow for repeated rooms" do
      maze = CreationalMaze::Maze.new
      room1 = Rooms::EnchantedRoom.new(1)
      maze.add_room(room1)
      
      room2 = Rooms::EnchantedRoom.new(1)
      
      expect { maze.add_room(room2) }.to change { maze.rooms.size }.by(0)
    end
    
    it "adds a new room to the maze" do
      maze = CreationalMaze::Maze.new
      room = Rooms::EnchantedRoom.new(1)
      maze.add_room(room)

      expect(maze.rooms).to include(room)
    end
  end
end
