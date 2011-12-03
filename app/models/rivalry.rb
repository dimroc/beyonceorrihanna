class Rivalry < ActiveRecord::Base
  has_many :rivalry_characters, dependent: :destroy
  has_many :characters, through: :rivalry_characters
  has_many :votes, through: :rivalry_characters

  scope :random , order("random()")

  def to_s
    rval = ""
    characters.each_with_index do |character, index|
      rval << character.name
      rval << " vs " unless index == characters.length - 1
    end
    rval
  end
end
