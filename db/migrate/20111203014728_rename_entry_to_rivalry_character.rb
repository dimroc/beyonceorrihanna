class RenameEntryToRivalryCharacter < ActiveRecord::Migration
  def change
    rename_table :entries, :rivalry_characters
  end
end
