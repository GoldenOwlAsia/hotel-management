# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_name              :string
#  first_name             :string
#  last_name              :string
#

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    user_name { Faker::Name.name }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password { 'opensesame' }
  end
end
