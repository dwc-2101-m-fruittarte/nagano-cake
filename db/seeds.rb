# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manager.create!(
   email: 'aaa@aaa',
   password: '123456'
)

Order.create!(
   customers_id: "7",
   name: "りん",
   bill: "550",
   shipping: "220",
   payment_method: "1"
)