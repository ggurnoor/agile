# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Customer.create!([
  { full_name: "Shah Rukh Khan", phone_number: "204-111-2222", email: "srk@bollywood.com", notes: "King of Bollywood", image_url: "https://example.com/images/shah_rukh_khan.jpg" },
  { full_name: "Amitabh Bachchan", phone_number: "204-333-4444", email: "bigb@bollywood.com", notes: "Legendary actor", image_url: "https://example.com/images/amitabh_bachchan.jpg" },
  { full_name: "Deepika Padukone", phone_number: "204-555-6666", email: "deepika@bollywood.com", notes: "Award-winning actress", image_url: "https://example.com/images/deepika_padukone.jpg" },
  { full_name: "Priyanka Chopra", phone_number: "204-777-8888", email: nil, notes: "Hollywood and Bollywood star", image_url: "https://example.com/images/priyanka_chopra.jpg" }
])
