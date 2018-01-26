task :setup_data => :environment do
	10.times do
		City.create(name: Faker::Address.city)
		Amenity.create(name: Faker::Lorem.word, description: Faker::Lorem.sentence)
	end
end