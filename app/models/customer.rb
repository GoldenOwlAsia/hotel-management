# == Schema Information
#
# Table name: customers
#
#  id           :bigint           not null, primary key
#  name         :string
#  customer_nin :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Customer < ApplicationRecord
  has_many :bookings
  has_many :orders
  has_many :rooms, through: :bookings, source: :rooms

  validates :customer_nin, presence: true
  validates :name, presence: true, length: { maximum: 30 }
  validates :phone_number, length: { maximum: 10 }
end
