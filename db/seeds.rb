# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.destroy_all

Product.create(name: "Asparagus", description: "Fresh green asparagus", price: "10€", stock_info: 200, unit: "kg", user_id: 1, category: "edible plant stem")
Product.create(name: "Potatoes", description: "Super duper potatoes", price: "2€", stock_info: 1000, unit: "kg", user_id: 1, category: "root")