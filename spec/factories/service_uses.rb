FactoryBot.define do
  factory :service_use do
    service { "" }
    booking { "" }
    quantity { 1 }
    price { "9.99" }
  end
end
