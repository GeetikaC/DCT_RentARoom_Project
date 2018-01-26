class City < ApplicationRecord
	has_many :rooms
	
	validates_presence_of :name
end
