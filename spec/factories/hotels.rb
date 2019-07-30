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
    name { Faker::Games::Pokemon.name }
    address { Faker::Address.full_address }
  end
end
