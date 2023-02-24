# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  Product.create!(
    title: Faker::Book.title,
    description: Faker::Lorem.sentences.join(' '),
    cost: Random.rand(100000),
    user_id: User.first.id,
    sold: false
  )
end