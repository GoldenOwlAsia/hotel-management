class Room < ApplicationRecord
  belongs_to :hotel

  validates :room_number, presence: true, length: { maximum: 10 }
  validates :status, presence: true
  validates :room_type, presence: true
  validates :floor_number, presence: true

  enum status: { booked: 'booked', rent: 'rent', available: 'available' }
  enum rent_type: { hourly: 'hourly', overnight: 'overnight' }
  enum room_type: { standard: 'standard', superior: 'superior', vip: 'vip' }
end
