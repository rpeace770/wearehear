class AddSpecialPathColumnToText < ActiveRecord::Migration[5.1]
  def change
      add_column :texts, :special_path, :string
  end
end
