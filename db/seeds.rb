# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Location.create(lat: 40.712, lng: -74.005)
Location.create(lat: 34.052, lng: -118.243)
Location.create(lat: 41.878, lng: -87.629)
Location.create(lat: 29.760, lng: -95.369)
Location.create(lat: 29.424, lng: -98.493)
Location.create(lat: 32.776, lng: -96.796)
Location.create(lat: 37.774, lng: -122.419)
Location.create(lat: 32.755, lng: -97.330)
Location.create(lat: 30.267, lng: -97.743)
Location.create(lat: 32.735, lng: -97.108)


Song.create(artist: "Daughter", album: "Not To Disappear", track: "No Care", spotify_id: "26Ggcaz8arFAehpsfFTiRj")
Song.create(artist: "Beyoncé", album: "Beyoncé", track: "Partition", spotify_id: "5hgnY0mVcVetszbb85qeDg")
Song.create(artist: "Joseph", album: "I'm Alone,No You're Not", track: "Blood & Tears", spotify_id: "7B4iQ8RPM3U7gKgySIq8yv")
Song.create(artist: "The Big Moon", album: "Love in the 4th Dimension", track: "The End", spotify_id: "6Eq7yjlMipfXATKb2ggndn")
Song.create(artist: "Balmorhea", album: "All Is Wild, All Is Silent", track: "Truth", spotify_id: "52IFQxFkt9fyYmIu1omQ69")
Song.create(artist: "Marika Hackman", album: "I'm Not Your Man", track: "Boyfriend", spotify_id: "68wm2y2dmgLzlwSIEi5IaD")
Song.create(artist: "John Van Deusen", album: "The Universal Sigh", track: "I Was Sick", spotify_id: "2QA0rBbtFRuxQpI7HbXtDf")
Song.create(artist: "Warpaint", album: "Warpaint", track: "Disco//very", spotify_id: "37Oojxm0tKyUFiyfn52LHU")
Song.create(artist: "Angel Olsen", album: "Burn Your Fire For No Witness", track: "Forgive/Forgotten", spotify_id: "2QGSwm7GoxcIcDDFpH8USV")
Song.create(artist: "Kanye West", album: "The Life of Pablo", track: "Ultralight Beam", spotify_id: "1eQBEelI2NCy7AUTerX0KS")

30.times do
  User.create(provider: "spotify", uid: Faker::Internet.password, email: Faker::Internet.email, password: "password", username: Faker::Internet.user_name, birthdate: Time.now, picture_url: "lightbulb.png")
end

500.times do
  Bouquet.create(sender_id: rand(1..30), sender_name: Faker::Name.first_name, receiver_name: Faker::Name.first_name, song_id: rand(1..10), custom_location: Faker::Hipster.word, location_id: rand(1..50), expiration_date: (Time.now + 700000), comment: Faker::Hipster.sentence(5))
end
