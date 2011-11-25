class AddImageToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :image_url, :string
  end
end
