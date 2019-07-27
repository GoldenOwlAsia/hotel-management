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

FactoryBot.define do
  factory :room do
    hotel
    room_number { '101' }
    rent_type { 'hourly' }
    floor_number { 1 }
    room_type { 'single' }
  end
end
