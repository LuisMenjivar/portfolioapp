class AddWikyPublicDefault < ActiveRecord::Migration
  def change
    def change
      change_column_default(:wikies, :public, true)
    end
  end
end
