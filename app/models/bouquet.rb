require 'securerandom'

class Bouquet < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :location
  belongs_to :song

  before_save :randomize

  mount_uploader :image, ImageUploader

  def randomize
    self.secret = SecureRandom.hex(3)
  end

  def special_path
    "http://localhost:3000/bouquets/#{self.id}/?secret=" + self.secret
  end

end

