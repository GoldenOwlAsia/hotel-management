class Room < ApplicationRecord
  belongs_to :hotel

  has_many :bookings
  has_many :customers, through: :bookings, source: :customers

  validates :room_number, presence: true, length: { maximum: 10 }
  validates :status, presence: true
  validates :room_type, presence: true
  validates :floor_number, presence: true

  enum status: { booked: 'booked', rent: 'rent', available: 'available' }
  enum rent_type: { hourly: 'hourly', overnight: 'overnight' }
  enum room_type: { single: 'single', double: 'double', queen: 'queen' }
end
