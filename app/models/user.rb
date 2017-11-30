class User < ApplicationRecord

  has_secure_password

  has_many :comments, dependent: :destroy

  # has_many :favorites, dependent: :destroy
  has_many :saved_recipes, foreign_key: "user_id", class_name: "Favorite"

  has_many :recipes, dependent: :destroy

  validates_uniqueness_of :email
  validates :email, presence: true
  validates :password_digest, presence: true
end
