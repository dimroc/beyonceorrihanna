class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :entry
      t.string :ip

      t.timestamps
    end
  end
end
