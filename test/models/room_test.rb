# == Schema Information
#
# Table name: rooms
#
#  id           :bigint           not null, primary key
#  room_number  :string
#  room_type    :string
#  hotel_id     :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  floor_number :integer
#  status       :string
#

require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
