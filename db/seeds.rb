# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.destroy_all
Recipe.destroy_all
User.destroy_all

troy = User.create(
  {
    name: "Troy Sipprelle",
    email: "troysipprelle@aol.com"
  }
)
jackie = User.create(
  {
    name: "Jackie Orr",
    email: "jackieorr@hotmail.com"
  }
)

choco = Recipe.create(
   {
     title: "Chocolate Chip Cookies",
     instructions: "Measure and mix wet and dry ingredients / Add chocolate / Bake / Eat",
     user: troy
   }
)

chicko = Recipe.create(
   {
     title: "Chicken Parmesan",
     instructions: "Pile chicken, cheese, and tomato sauce / Bake / Eat",
     user: troy
   }
)

choco.comments.create(
  {
    content: "Wow these are the best cookies ever",
    user: jackie
  }
)

chicko.comments.create(
  {
    content: "Hmm chicken's not the thing for me",
    user: jackie
  }
)
