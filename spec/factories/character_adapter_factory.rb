# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :character_adapter do
    association :character
    association :rivalry
  end
end
