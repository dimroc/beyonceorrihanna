class AddYoutubeToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :youtube_url, :string
  end
end
