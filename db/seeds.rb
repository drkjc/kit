# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
  {name: "derek", email: "derek@derek.com", password_digest: "test"},
  {name: "kelley", email: "kelley@kelley.com", password_digest: "test"},
  {name: "jake", email: "jake@jake.com", password_digest: "test"},
  {name: "mark", email: "mark@mark.com", password_digest: "test"},
  {name: "kathy", email: "kathy@kathy.com", password_digest: "test"}
])

