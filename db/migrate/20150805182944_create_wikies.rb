class CreateWikies < ActiveRecord::Migration
  def change
    create_table :wikies do |t|
      t.string :title
      t.text :body
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :wikies, :users
  end
end
