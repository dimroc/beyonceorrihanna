FactoryGirl.define do
  factory :vote do
    association :rivalry_character
    ip { Faker::Internet.ip_v4_address }
  end
end