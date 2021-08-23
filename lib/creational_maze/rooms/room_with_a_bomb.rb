module Rooms
  class RoomWithABomb < Room
    attr_accessor :has_bomb, :has_gone_off
  end
end
