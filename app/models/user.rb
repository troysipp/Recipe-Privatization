class User < ApplicationRecord

  has_secure_password

  has_many :comments, dependent: :destroy

  # has_many :favorites, dependent: :destroy
  has_many :saved_recipes, foreign_key: "user_id", class_name: "Favorite"

  # The above logic sets up Favorite as the entity on the other side of the
  # query (where you will still have to query through to Recipe). If you want
  # to connect this relationship all the way through to Recipe, try something
  # like this:
  #
  # has_many :favorites, dependent: :destroy
  # has_many :saved_recipes, through: :favorites, class_name: "Recipe"
  # ^ Not sure if you will need the foreign_key: option or not

  has_many :recipes, dependent: :destroy

  validates_uniqueness_of :email
  validates :email, presence: true
  validates :password_digest, presence: true
end
