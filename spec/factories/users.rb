FactoryBot.define do
  factory :user do
    email { 'hongvan@gmail.com'}
    user_name { 'Pika' }
    first_name { 'Van' }
    last_name { 'Ngo' }
    password {'opensesame'}
  end
end
