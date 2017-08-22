class RemoveImageUrlColumnFromText < ActiveRecord::Migration[5.1]

  def change
    change_table :texts do |t|
      t.remove :image_url
    end
  end
end
