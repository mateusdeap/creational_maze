require "spec_helper"

RSpec.describe Rooms::Room do
  describe "#initialize" do
    it "sets a room number to the number passed into #new" do
      room = Rooms::Room.new(1)
      expect(room.room_number).to be(1)
    end

    it "initializes an empty Hash for the @sides attribute" do
      room = Rooms::Room.new(1)
      expect(room.sides).to be_a(Hash)
      expect(room.sides).to be_empty
    end
  end

  describe "#set_side" do
    context "given a valid direction and a valid map site" do
      it "sets the map site as value to the given direction" do
        room = Rooms::Room.new(1)
        wall = Walls::Wall.new

        room.set_side(Directions::NORTH, wall)
        expect(room.sides).to include(north: wall)
      end
    end

    context "given an invalid direction and a valid map site" do
      it "raises an ArgumentError" do
        room = Rooms::Room.new(1)
        wall = Walls::Wall.new

        expect { room.set_side(wall, wall) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#get_side" do
    context "given a valid direction" do
      it "it returns the map site of that direction" do
        room = Rooms::Room.new(1)
        wall = Walls::Wall.new

        room.set_side(Directions::SOUTH, wall)
        expect(room.get_side(Directions::SOUTH)).to be(wall)
      end
    end
  end

  describe "#get_doors" do
    context "given the room has no doors" do
      it "returns an empty array" do
        room1 = Rooms::Room.new(1)

        expect(room1.get_doors).to be_empty
      end
    end

    context "given the room has any doors" do
      it "returns an array containing the doors" do
        room1 = Rooms::Room.new(1)
        room2 = Rooms::Room.new(2)
        door = Doors::Door.new(room1, room2)

        room1.set_side(Directions::NORTH, door)

        expect(room1.get_doors).to eq([door])
      end
    end
  end

  describe "#get_direction" do
    context "given the room has the requested map site" do
      it "returns the direction of the map site" do
        room = Rooms::Room.new(1)
        wall1 = Walls::Wall.new
        wall2 = Walls::Wall.new
        wall3 = Walls::Wall.new
        wall4 = Walls::Wall.new

        room.set_side(Directions::NORTH, wall1)
        room.set_side(Directions::EAST, wall2)
        room.set_side(Directions::SOUTH, wall3)
        room.set_side(Directions::WEST, wall4)

        expect(room.get_direction(wall1)).to be(:north)
        expect(room.get_direction(wall2)).to be(:east)
        expect(room.get_direction(wall3)).to be(:south)
        expect(room.get_direction(wall4)).to be(:west)
      end
    end

    context "given the room does not have the requested map site" do
      it "returns nil" do
        room = Rooms::Room.new(1)
        wall1 = Walls::Wall.new
        wall2 = Walls::Wall.new
        wall3 = Walls::Wall.new
        wall4 = Walls::Wall.new

        room.set_side(Directions::NORTH, wall1)
        room.set_side(Directions::EAST, wall2)
        room.set_side(Directions::SOUTH, wall3)
        room.set_side(Directions::WEST, wall4)

        wall_that_is_not_in_room = Walls::Wall.new

        expect(room.get_direction(wall_that_is_not_in_room)).to be_nil
      end
    end
  end
end
