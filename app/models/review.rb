class Review < ActiveRecord::Base
	belongs_to :user
	belongs_to :cookbook
	validates :content, presence: true
	validates :rating, presence: true, numericality: true
	validates :user_id, presence: true
	validates :cookbook_id, presence: true

end
