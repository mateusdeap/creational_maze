module Rooms
  class EnchantedRoom < Room
    attr_accessor :has_enchantment

    def initialize(room_no)
      super(room_no)
      @has_enchantment = true
    end
  end
end
