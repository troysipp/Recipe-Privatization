class User < ApplicationRecord

  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy

end
