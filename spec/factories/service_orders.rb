FactoryBot.define do
  factory :service_order do
    service { nil }
    order { nil }
    quantity { 1 }
    price { "9.99" }
  end
end
