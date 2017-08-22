class RemoveAttachmentImageFromBouquet < ActiveRecord::Migration[5.1]
  def change
    remove_attachment :bouquets, :image
  end
end
