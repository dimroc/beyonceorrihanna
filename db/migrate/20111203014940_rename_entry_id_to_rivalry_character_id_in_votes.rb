class RenameEntryIdToRivalryCharacterIdInVotes < ActiveRecord::Migration
  def change
    rename_column :votes, :entry_id, :rivalry_character_id
  end
end
