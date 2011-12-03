# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rivalry_character do
    association :character
    association :rivalry, factory: :pair_rivalry
  end
end
