class AmenityRoom < ApplicationRecord
	belongs_to :amenity
	belongs_to :room
	validates_presence_of :room_id, :amenity_id

end
