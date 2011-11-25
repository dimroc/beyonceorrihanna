class AddTwitterTagsToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :twitter_tags, :string
  end
end
