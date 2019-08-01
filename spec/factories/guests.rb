FactoryBot.define do
  factory :guest do
    guest_type { 'men' }
    quantity { 1 }
    booking
  end
end
