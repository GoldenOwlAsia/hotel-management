# == Schema Information
#
# Table name: services
#
#  id         :bigint           not null, primary key
#  name       :string
#  price      :decimal(, )
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Service < ApplicationRecord
  has_many :service_uses
  has_many :bookings, through: :servivce_uses
end
