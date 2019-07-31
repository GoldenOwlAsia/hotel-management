FactoryBot.define do
  factory :guest do
    guest_type { "MyString" }
    quantity { 1 }
    booking { nil }
  end
end
