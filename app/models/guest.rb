# == Schema Information
#
# Table name: guests
#
#  id         :bigint           not null, primary key
#  guest_type :string
#  quantity   :integer
#  booking_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Guest < ApplicationRecord
  belongs_to :booking

  enum guest_type: { women: 'women', men: 'men', baby_girl: 'baby_girl', baby_boy: 'baby_boy' }
end
