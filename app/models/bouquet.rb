class Bouquet < ApplicationRecord
  belongs_to :sender, class_name: :User
  belongs_to :location
  belongs_to :song

end

