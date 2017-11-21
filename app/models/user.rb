class User < ApplicationRecord

  has_secure_password

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates_uniqueness_of :email

end
