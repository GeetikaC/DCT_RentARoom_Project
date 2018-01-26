class Room < ApplicationRecord
	mount_uploader :images, PictureUploader
	belongs_to :user
	belongs_to :city, optional: true
	has_many :amenity_rooms
	has_many :amenities, through: :amenity_rooms
	has_many :bookings
	has_many :reviews
	has_many :special_prices

	after_save :set_new_role
	before_save :get_location_and_coordinates

	validates_presence_of :name, :description, :price, :rules, :address, :images
	validates_length_of :description, minimum: 150

	private
	def set_new_role
		self.user.update_attributes(id: self.user.id, role_id: Role.find_by_name('host').id)
		# self.user.update_attribute :host, true
		# self.user.role ||= Role.find_by_name('host')
	end 

	def get_location_and_coordinates
		response = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{self.address}&key=YOUR_KEY")
		puts "This is the result: #{response.parsed_response}"
		self.latitude = response["results"][0]["geometry"]["location"]["lat"]
		self.longitude = response["results"][0]["geometry"]["location"]["lng"]
	end
end