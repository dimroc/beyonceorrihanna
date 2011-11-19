FactoryGirl.define do
  factory :character do
    name { Faker::Name.first_name }
    caption { Faker::Lorem.sentence }
  end
end