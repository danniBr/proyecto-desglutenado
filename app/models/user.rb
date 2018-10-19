class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :photo, PhotoUploader
  has_many :questions
  has_many :recipes
  has_many :tags
  has_many :recipes, through: :tags
  has_many :comments
  has_many :locations
end
