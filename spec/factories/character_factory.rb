FactoryGirl.define do
  factory :character do
    name { Faker::Name.first_name }
    caption { Faker::Lorem.sentence }
    image_url { Faker::Internet.http_url }
    youtube_url { Faker::Internet.http_url }
    twitter_tags { [Faker::Name.first_name, Faker::Lorem.word].join(",") }
  end
end
