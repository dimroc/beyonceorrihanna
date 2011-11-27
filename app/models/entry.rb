class Entry < ActiveRecord::Base
  belongs_to :rivalry
  belongs_to :character

  validates_presence_of :rivalry_id
  validates_presence_of :character_id
  validates_uniqueness_of :character_id, scope: :rivalry_id
end
