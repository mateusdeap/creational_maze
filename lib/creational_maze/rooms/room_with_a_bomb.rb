module Rooms
  class RoomWithABomb < Room
    attr_accessor :has_bomb, :has_gone_off

    def initialize(room_no)
      super(room_no)
      @has_bomb = true
      @has_gone_off = false
    end
  end
end
