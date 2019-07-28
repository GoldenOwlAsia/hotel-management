# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  room_id       :bigint           not null
#  customer_id   :bigint           not null
#  checkin_time  :datetime
#  checkout_time :datetime
#  booked_at     :datetime
#  phone_number  :string
#  status        :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rent_type     :string
#

FactoryBot.define do
  factory :booking do
    room
    customer
    checkin_time { '2019-07-23 19:36:49' }
    checkout_time { '2019-07-23 19:36:49' }
    booked_at { '2019-07-23 19:36:49' }
    booking_phone_number { '0917889937' }
    status { 'checked_in' }
    rent_type { 'overnight' }
  end
end
