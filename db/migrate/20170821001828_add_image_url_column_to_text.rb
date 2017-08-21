class AddImageUrlColumnToText < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :image_url, :string
  end
end
