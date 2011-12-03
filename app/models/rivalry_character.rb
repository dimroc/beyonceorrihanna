class RivalryCharacter < ActiveRecord::Base
  belongs_to :rivalry
  belongs_to :character
  has_many :votes, dependent: :destroy

  validates_presence_of :rivalry_id
  validates_presence_of :character_id
  validates_uniqueness_of :character_id, scope: :rivalry_id

  def vote!(ip)
    Vote.create(rivalry_character: self, ip: ip)
  end
end
