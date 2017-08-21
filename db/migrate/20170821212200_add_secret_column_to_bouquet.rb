class AddSecretColumnToBouquet < ActiveRecord::Migration[5.1]
  def change
    add_column :bouquets, :secret, :string
  end
end
