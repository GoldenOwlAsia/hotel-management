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

class Room < ApplicationRecord
  belongs_to :hotel

  has_many :bookings, dependent: :nullify
  has_many :customers, through: :bookings, source: :customers

  validates :room_number, presence: true, length: { maximum: 10 }
  validates :room_type, presence: true
  validates :floor_number, presence: true

  enum room_type: { single: 'single', double: 'double', queen: 'queen' }
end
