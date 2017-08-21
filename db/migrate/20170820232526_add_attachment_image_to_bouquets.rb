class AddAttachmentImageToBouquets < ActiveRecord::Migration[5.1]
  def self.up
    change_table :bouquets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bouquets, :image
  end
end
