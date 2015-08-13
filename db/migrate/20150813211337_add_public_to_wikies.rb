class AddPublicToWikies < ActiveRecord::Migration
  def change
    add_column :wikies, :public, :boolean, default: true
  end
end
