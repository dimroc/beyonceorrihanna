# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rivalry do
  end
  factory :pair_rivalry, parent: :rivalry do
    entries { |entries| [entries.association(:entry, rivalry_id: :id), entries.association(:entry, rivalry_id: :id)] }
  end
end
