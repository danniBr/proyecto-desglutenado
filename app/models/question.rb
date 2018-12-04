class Question < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments

	validates :title, :description , :presence => true
end
