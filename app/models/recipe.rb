class Recipe < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  # has_many :saved_recipes, foreign_key: "recipe_id", class_name: "Favorite"

end
