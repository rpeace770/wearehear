require 'securerandom'

class Bouquet < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :location
  belongs_to :song
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" }
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  before_save :randomize

  def randomize
    self.secret = SecureRandom.hex(3)
  end

  def special_path
    "http://localhost:3000/bouquets/#{self.id}/?secret=" + self.secret
  end
end

