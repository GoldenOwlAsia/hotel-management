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

FactoryBot.define do
  factory :booking do
    room
    customer
    checkin_time { '2019-07-23 19:36:49'.to_datetime }
    checkout_time { '2019-07-23 19:36:49'.to_datetime }
    status { 'checked_in' }
    rent_type { 'overnight' }
  end
end
