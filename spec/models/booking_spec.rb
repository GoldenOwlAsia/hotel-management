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

require 'rails_helper'

RSpec.describe Booking, type: :model do
end
