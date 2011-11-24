FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.word }
  end

  factory :admin, parent: :user do
    admin { true }
  end
end