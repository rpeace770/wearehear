class Bouquet < ApplicationRecord
  belongs_to :sender, class_name: :user
  belongs_to :receiver, class_name: :user
  belongs_to :location
  belongs_t0 :song
end
