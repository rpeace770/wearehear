class Bouquet < ApplicationRecord
  belongs_to :sender, class_name: :user
  belongs_to :receiver, class_name: :user
  belongs_to :song
  belongs_to :location
end
