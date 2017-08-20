class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    change_table :locations do |t|
      t.remove :city, :state, :country
    end
  end
end
