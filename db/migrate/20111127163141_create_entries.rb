class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.column :rivalry_id, :integer, null: false
      t.column :character_id, :integer, null: false
      t.column :votes, :integer, default: 0
      t.timestamps
    end
  end
end
