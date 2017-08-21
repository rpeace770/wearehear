class RemoveImageColumnFromBouquet < ActiveRecord::Migration[5.1]
  def change
    change_table :bouquets do |t|
      t.remove :photo
  end
  end
end
