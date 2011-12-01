class RenameVotesToVotesCount < ActiveRecord::Migration
  def change
    rename_column :entries, :votes, :votes_count
  end
end
