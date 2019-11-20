# == Schema Information
#
# Table name: service_uses
#
#  id         :bigint           not null, primary key
#  service_id :bigint           not null
#  booking_id :bigint           not null
#  quantity   :integer
#  price      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ServiceUse < ApplicationRecord
  belongs_to :service
  belongs_to :booking
end
