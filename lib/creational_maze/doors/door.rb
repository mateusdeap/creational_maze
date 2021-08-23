module CreationalMaze
  class Door < MapSite
    attr_accessor :is_open

    def initialize(room_1:, room_2:)
      @room_1 = room_1
      @room_2 = room_2
    end

    def enter; end

    def other_side_froom(room:); end
  end
end
