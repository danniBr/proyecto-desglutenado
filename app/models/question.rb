class Question < ApplicationRecord
	belongs_to :user, optional: true
	has_many :comments, dependent: :destroy

	validates :title, :description , :presence => true
end
