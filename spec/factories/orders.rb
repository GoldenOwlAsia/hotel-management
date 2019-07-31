FactoryBot.define do
  factory :order do
    customer { nil }
    order_date { "2019-07-31 16:08:14" }
    total { "9.99" }
    paid { "9.99" }
    payment_method { "MyString" }
  end
end
