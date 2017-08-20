class Bouquet < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :location
  belongs_to :song
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

