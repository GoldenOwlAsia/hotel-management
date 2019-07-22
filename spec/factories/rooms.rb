FactoryBot.define do
  factory :room do
    hotel
    room_number { '101' }
    status { 'rent' }
    rent_type { 'hourly' }
    floor_number { 1 }
    room_type { 'standard' }
  end
end
