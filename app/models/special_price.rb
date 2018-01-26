class SpecialPrice < ApplicationRecord
	belongs_to :room
	validates_presence_of :start_date, :end_date, :price, :room_id
end