class CreateBouquets < ActiveRecord::Migration[5.1]
  def change
    create_table :bouquets do |t|
      t.string :sender_name
      t.string :receiver_name
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :song_id
      t.string :custom_location
      t.integer :location_id
      t.datetime :expiration_date
      t.text :comment
      t.string :photo

      t.timestamps
    end
  end
end
