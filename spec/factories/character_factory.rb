FactoryGirl.define do
  factory :character do
    name { Faker::Name.first_name }
    caption { Faker::Lorem.sentence }
    image_url { Faker::Internet.http_url }
    youtube_url { Faker::Internet.http_url }
  end
end
