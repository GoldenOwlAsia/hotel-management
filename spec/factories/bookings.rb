FactoryBot.define do
  factory :booking do
    room { nil }
    customer { nil }
    checkin_time { "2019-07-23 19:36:49" }
    checkout_time { "2019-07-23 19:36:49" }
    booked_at { "2019-07-23 19:36:49" }
    phone_number { "MyString" }
    status { "MyString" }
  end
end
