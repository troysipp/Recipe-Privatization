# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Favorite.destroy_all
Recipe.destroy_all
User.destroy_all

users = User.create([
  {
    name: "Troy Sipprelle",
    display_name: "troysippy",
    email: "tcsjediknight@aol.com",
    password: "soccer",
    password_confirmation: "soccer"
  },
  {
    name: "Jackie Orr",
    display_name: "jso",
    email: "jorr@hotmail.com",
    password: "hockey",
    password_confirmation: "hockey"
  }
])

choco = users.first.recipes.create(
   {
     title: "Chocolate Chip Cookies",
     instructions: "Measure and mix wet and dry ingredients / Add chocolate / Bake / Eat"
   }
)

chicko = users.first.recipes.create(
   {
     title: "Chicken Parmesan",
     instructions: "Pile chicken, cheese, and tomato sauce / Bake / Eat"
   }
)

choco.comments.create(
  {
    content: "Wow these are the best cookies ever",
    user: users.last
  }
)

chicko.comments.create(
  {
    content: "Hmm chicken's not the thing for me",
    user: users.last
  }
)
