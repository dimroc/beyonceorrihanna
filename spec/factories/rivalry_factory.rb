# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rivalry do
  end

  factory :pair_rivalry, parent: :rivalry do
    after_create do |rivalry|
      Factory(:rivalry_character, rivalry: rivalry)
      Factory(:rivalry_character, rivalry: rivalry)
    end
  end
end