class Recipe < ApplicationRecord
	belongs_to :user
	has_many :tags
	has_many :users, through: :tags
	has_many :comments

end
