require "spec_helper"

RSpec.describe Builders::RandomMazeBuilder do
  context "initialization" do
    it "provides an array of factories" do
      rmb = Builders::RandomMazeBuilder.new

      expect(rmb.factories).to be_an(Array)
      expect(rmb.factories).not_to be_empty
      expect(rmb.factories).to all(respond_to(:make_maze))
      expect(rmb.factories).to all(respond_to(:make_wall))
      expect(rmb.factories).to all(respond_to(:make_room))
      expect(rmb.factories).to all(respond_to(:make_door))
    end
  end

  context "usage" do
    describe "#build_maze" do
      it "creates a new maze for the builder" do
        rmb = Builders::RandomMazeBuilder.new
        rmb.build_maze

        expect(rmb.current_maze).not_to be_nil
        expect(rmb.current_maze).to be_a(CreationalMaze::Maze)
      end
    end

    describe "#build_room" do
      context "given there is no current maze" do
        it "raises an error" do
          rmb = Builders::RandomMazeBuilder.new

          expect { rmb.build_room(1) }.to raise_error do |error|
            expect(error).to be_a(Builders::Errors::InvalidStateError)
          end
        end
      end

      context "given there is a current maze" do
        it "adds a room to the current maze" do
          rmb = Builders::RandomMazeBuilder.new
          rmb.build_maze

          expect { rmb.build_room(1) }.to change { rmb.current_maze.rooms }
        end
      end
    end

    describe "#build_door" do
      context "given there is no current maze" do
        it "raises an error" do
          rmb = Builders::RandomMazeBuilder.new

          expect { rmb.build_door(Rooms::EnchantedRoom.new(1), Rooms::RoomWithABomb.new(2)) }.to raise_error do |error|
            expect(error).to be_a(Builders::Errors::InvalidStateError)
          end
        end
      end

      context "given the maze has no rooms" do
        it "raises an error" do
          rmb = Builders::RandomMazeBuilder.new
          rmb.build_maze

          expect { rmb.build_door(Rooms::EnchantedRoom.new(1), Rooms::RoomWithABomb.new(2)) }.to raise_error do |error|
            expect(error).to be_a(Builders::Errors::InvalidStateError)
          end
        end
      end

      context "given a maze with at least two rooms" do
        it "adds a door to both rooms" do
          rmb = Builders::RandomMazeBuilder.new
          rmb.build_maze
          rmb.build_room(1)
          rmb.build_room(2)
          rmb.build_door(1, 2)

          room1 = rmb.current_maze.room_no(1)
          room2 = rmb.current_maze.room_no(2)

          expect(room1.sides.values).to include(a_kind_of(Doors::Door))
          expect(room2.sides.values).to include(a_kind_of(Doors::Door))
        end

        context "given the door was added" do
          let(:rmb) { Builders::RandomMazeBuilder.new }

          before :each do
            rmb.build_maze
            rmb.build_room(1)
            rmb.build_room(2)
            rmb.build_door(1, 2)
          end

          it "adds the door to a common wall" do
            room1 = rmb.current_maze.room_no(1)
            room2 = rmb.current_maze.room_no(2)

            door_to_2 = room1.get_doors.first
            door_to_1 = room2.get_doors.first
            direction_of_room2 = room1.get_direction(door_to_2)
            direction_of_room1 = room2.get_direction(door_to_1)

            expect(direction_of_room2).to eq(rmb.opposite_direction(direction_of_room1))
          end
        end
      end
    end
  end
end
