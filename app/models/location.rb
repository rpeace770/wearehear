class Location < ApplicationRecord
  attr_accessor :address

  has_many :bouquets

  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode

end
