task :clear_data => :environment do
	City.delete_all
	Amenity.delete_all
	Room.delete_all
end