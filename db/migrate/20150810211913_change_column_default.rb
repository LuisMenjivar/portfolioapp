class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:wikies, :public, true)
  end
end