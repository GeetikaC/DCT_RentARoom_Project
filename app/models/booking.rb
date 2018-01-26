class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :room
	
	validates_presence_of :start_date, :end_date, :price
	validate :check_dates

	def set_price
		requested_dates = (self.start_date..self.end_date).to_a
		@total_price = 0
		self.room.special_prices.each do |date|
			special_dates = (date.start_date..date.end_date).to_a
			if !(special_dates & requested_dates).empty?
				special_price = date.price
				regular_dates = requested_dates-special_dates
				@total_price = ((regular_dates.length * self.room.price) + (special_dates.length * special_price))
			end
		end
		if @total_price == 0
			@total_price = requested_dates.length * self.room.price
		end
		self.price = @total_price		
	end

	def check_dates
		if (self.start_date < Date.today) || (self.end_date < Date.today)
			errors.add(:base, "These dates have passed")
		else
			Booking.where('room_id = ?', self.room_id).each do |booking|
				booked_dates = (booking.start_date..booking.end_date).to_a
				requested_dates = (self.start_date..self.end_date).to_a
				if (booked_dates.include? self.start_date) || (booked_dates.include? self.end_date) || (requested_dates.length != (requested_dates-booked_dates).length)
					errors.add(:base, "These dates have been booked already")
				end
			end
		end
	end

end