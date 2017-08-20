class RemoveColumnBouquet < ActiveRecord::Migration[5.1]
  def change
    change_table :bouquets do |t|
      t.remove :receiver_id
    end
  end
end
