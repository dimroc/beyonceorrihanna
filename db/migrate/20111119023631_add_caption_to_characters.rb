class AddCaptionToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :caption, :text
  end
end
