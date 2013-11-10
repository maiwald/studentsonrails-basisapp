class Cookbook < ActiveRecord::Base
	has_many :reviews
	validates :isbn, presence: true
	validates :author, presence: true
	validates :title, presence: true
	validates :price, numericality: true

	def average_rating
		if reviews.count > 0
			reviews.map(&:rating).reduce(&:+)/reviews.count
		end

	end
end
