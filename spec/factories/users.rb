FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    user_name { Faker::Name.name }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    password { 'opensesame' }
  end
end
