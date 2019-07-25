# == Schema Information
#
# Table name: hotels
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :hotel do
    name { 'Gia An' }
    address { '195 Nguyen Hue, Ben Nghe, Quan 1' }
  end
end
