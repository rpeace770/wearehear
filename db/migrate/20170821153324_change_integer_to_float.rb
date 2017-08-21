class ChangeIntegerToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :locations, :lat, :float
    change_column :locations, :lng, :float
  end
end
