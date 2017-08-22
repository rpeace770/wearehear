class AddImageColumnToText < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :image, :string
  end
end
