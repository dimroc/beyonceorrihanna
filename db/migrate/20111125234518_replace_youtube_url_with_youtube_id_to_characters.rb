class ReplaceYoutubeUrlWithYoutubeIdToCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :youtube_url
    add_column :characters, :youtube_id, :string
  end
end
