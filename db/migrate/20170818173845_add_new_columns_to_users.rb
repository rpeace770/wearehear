class AddNewColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :username, :string
    add_column :users, :picture_url, :string
  end
end
