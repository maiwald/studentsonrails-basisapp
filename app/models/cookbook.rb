class Cookbook < ActiveRecord::Base
	validates :isbn, presence: true
	validates :author, presence: true
	validates :title, presence: true
	validates :price, numericality: true
end
