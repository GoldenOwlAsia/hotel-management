FactoryBot.define do
  factory :role do
    name { 'owner' }
    user
    hotel
  end
end
