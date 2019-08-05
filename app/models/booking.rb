# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  room_id       :bigint           not null
#  customer_id   :bigint           not null
#  checkin_time  :datetime
#  checkout_time :datetime
#  phone_number  :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rent_type     :string
#

class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :customer
  belongs_to :order, optional: true

  has_many :guests, dependent: :destroy

  validates :rent_type, presence: true
  validates :checkin_time, presence: true

  enum status: { checked_in: 'checked_in', unchecked_in: 'unchecked_in' }
  enum rent_type: { hourly: 'hourly', overnight: 'overnight' }

  def self.period(start_time, end_time)
    where(
      '(checkin_time <= ? AND ? <= checkout_time) OR ' +
      '(checkin_time <= ? AND ? <= checkout_time) OR ' +
      '(? <= checkin_time AND checkin_time <= ?)',
      start_time,
      start_time,
      end_time,
      end_time,
      start_time,
      end_time
    )
  end
end
