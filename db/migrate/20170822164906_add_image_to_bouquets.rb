class AddImageToBouquets < ActiveRecord::Migration[5.1]
  def change
    add_column :bouquets, :image, :string
  end
end
