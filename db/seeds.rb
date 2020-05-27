# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all
Review.destroy_all
Order.destroy_all
Category.destroy_all

categories =  ["Leafy green", "Cruciferous", "Marrow", "Root", "Edible plant stem", "Allium"]

categories.each do |categorie|
    Category.create(name: categorie )
end
