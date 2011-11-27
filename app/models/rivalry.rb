class Rivalry < ActiveRecord::Base
  has_many :entries
  has_many :characters, through: :entries

  def to_s
    rval = ""
    characters.each_with_index do |character, index|
      rval << character.name
      rval << " vs " unless index == characters.length - 1
    end
    rval
  end
end
