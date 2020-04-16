# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Location.destroy_all
# Listing.destroy_all
# Reservation.destroy_all
# Review.destroy_all
# Trip.destroy_all

# 10.times do 
#     User.create!(first_name: Faker::Name.name, last_name: Faker::Name.name, age: rand(21..30), email: Faker::Internet.email, password_digest: Faker::Internet.password)
# end

# 20.times do 
#     Location.create!(city: Faker::Address.city, country: Faker::Address.country)
# end

# 10.times do 
#     Listing.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, address: Faker::Address.full_address, rental_type: "room", price: 100, host_id: User.all.sample.id, amenities: "wifi", location_id: Location.all.sample.id)
# end

# 10.times do 
#     Reservation.create!(checkin: Date.parse("#{Faker::Date.in_date_period}"), checkout: Date.parse("#{Faker::Date.in_date_period}"), listing_id: Listing.all.sample.id, guest_id: User.all.sample.id, confirmation_number: rand(1000...2000), guest_amount: rand(1..5))
# end

# 5.times do 
#     Review.create!(rating:rand(1..5), description: Faker::Lorem.paragraph, reservation_id: Reservation.all.sample.id , guest_id:User.all.sample.id, listing_id:Listing.all.sample.id, host_id:User.all.sample.id, title: Faker::Lorem.sentence)
# end

# 10.times do
#     Trip.create!(location_id: Location.all.sample.id, listing_id: Listing.all.sample.id, guest_id: User.all.sample.id, host_id: User.all.sample.id, reservation_id: Reservation.all.sample.id)
end