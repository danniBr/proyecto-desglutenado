class Recipe < ApplicationRecord
	mount_uploader :photo, PhotoUploader

	belongs_to :user, optional: true
	has_many :tags
	has_many :users, through: :tags
	has_many :comments
	has_many :likes

  validates :title, :ingredients, :description , :presence => true
	validates :cant, numericality: true
end
