# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


u1 = User.create!(username: 'TheoNeo')
a1 = Artwork.create!(artist_id: u1.id,title: "Dunkin",image_url: "SDFSDFSDFASD")

u2 = User.create!(username: 'michellemybelle')
a2 = Artwork.create!(artist_id: u2.id,title: "Starry Night",image_url: "sdjfk")

ArtworkShare.create!(viewer_id: u1.id, artwork_id: a1.id)
ArtworkShare.create!(viewer_id: u2.id, artwork_id: a1.id)