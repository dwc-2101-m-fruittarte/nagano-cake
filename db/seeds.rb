# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Manager.create!(
#     email: 'aaa@aa',
#     password: '123456'
# )

# Product.create!(
#     name: 'フルーツタルト',
#     introduction: '旬な果物を使用したタルト',
#     price: '500円',
#     image: File.open('./app/assets/images/noimage-1024x898.png')
#     )


Manager.create!(
   email: 'aaa@aaa',
   password: '123456'
)

Product.create!(
   name: 'ケーキ',
   price: '10,000',
   introduction: 'ケーキです'
)