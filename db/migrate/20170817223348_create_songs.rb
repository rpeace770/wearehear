class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :album
      t.string :track
      t.integer :spotify_id

      t.timestamps
    end
  end
end
