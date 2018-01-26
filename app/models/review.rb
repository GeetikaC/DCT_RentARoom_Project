class Review < ApplicationRecord
	belongs_to :room
	belongs_to :user

	validates_presence_of :review, :food_rating, :cleanliness_rating, :safety_rating, :facility_rating, :locality_rating, :user_id
	validates_length_of :review, minimum: 150
	validates_numericality_of :food_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
	validates_numericality_of :cleanliness_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
	validates_numericality_of :safety_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
	validates_numericality_of :facility_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5
	validates_numericality_of :locality_rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5

end
