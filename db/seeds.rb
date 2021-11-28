# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Carpark.create(location: 'airport', available: 10, total: 10, green: 2, disabled: 2)
Carpark.create(location: 'hospital', available: 10, total: 10, green: 2, disabled: 3)
Carpark.create(location: 'retail_park', available: 10, total: 10, green: 2, disabled: 3)
Carpark.create(location: 'park_and_ride', available: 10, total: 10, green: 2, disabled: 3)
