class ChangeColumnTypeOnSongsTable < ActiveRecord::Migration[5.1]
  def change
    change_table :songs do |t|
      t.change :spotify_id, :string
    end
  end
end
