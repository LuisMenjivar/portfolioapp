class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
    t.integer :wiky_id
    t.integer :user_id

    t.timestamps null: false
  end
  add_index :collaborations, :user_id
  add_index :collaborations, :wiky_id
  add_index :collaborations, [:user_id, :wiky_id], unique: true
  end
end