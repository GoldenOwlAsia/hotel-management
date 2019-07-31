FactoryBot.define do
  factory :guest do
    room { nil }
    women { 1 }
    men { 1 }
    baby_girl { 1 }
    baby_boy { 1 }
  end
end
