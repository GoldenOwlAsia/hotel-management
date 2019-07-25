# == Schema Information
#
# Table name: roles
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :bigint           not null
#  hotel_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  belongs_to :user
  belongs_to :hotel
  enum name: { owner: 'owner', staff: 'staff' }
end
