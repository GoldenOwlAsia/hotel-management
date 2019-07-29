class RoomFilter
  include ActiveModel::Model
  attr_accessor :checkin_time
  attr_accessor :checkout_time
  attr_accessor :room_status
end
