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

FactoryBot.define do
  factory :role do
    name { 'owner' }
    user
    hotel
  end
end
