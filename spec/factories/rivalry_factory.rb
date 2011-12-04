# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rivalry do
  end

  factory :pair_rivalry, parent: :rivalry do
    rivalry_characters { |entries| [entries.association(:rivalry_character, rivalry_id: :id), entries.association(:rivalry_character, rivalry_id: :id)] }
  end
end