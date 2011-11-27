FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "test"
  end

  factory :admin, parent: :user do
    admin true
  end
end
