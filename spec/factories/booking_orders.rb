FactoryBot.define do
  factory :booking_order do
    booking { nil }
    order { nil }
    price { "9.99" }
  end
end
