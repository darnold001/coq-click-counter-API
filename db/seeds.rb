# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
users = User.create([{ username: 'test user' }, { username: 'test user 2' }])
images = Image.create([{ url: 'https://cdn.britannica.com/55/174255-050-526314B6/brown-Guernsey-cow.jpg', alt: 'happy cow', user_id: 1}, { url: 'https://scx2.b-cdn.net/gfx/news/hires/2018/cow.jpg', alt: 'hungry cow', user_id: 1}])
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
