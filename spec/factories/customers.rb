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

FactoryBot.define do
  factory :customer do
    name { Faker::Name.name }
    customer_nin { Faker::Number.number(9) }
    phone_number { Faker::Number.number(10) }
  end
end
