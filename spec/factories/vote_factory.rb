FactoryGirl.define do
  factory :vote do
    association :entry
    ip { Faker::Internet.ip_v4_address }
  end
end