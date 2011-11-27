class CreateRivalries < ActiveRecord::Migration
  def change
    create_table :rivalries do |t|
      t.timestamps
    end
  end
end
