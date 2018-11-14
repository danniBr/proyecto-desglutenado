class Location < ApplicationRecord
	belongs_to :user

	geocoded_by :location
	reverse_geocoded_by :latitude, :longitude, :address => :location
    after_validation :geocode
end
