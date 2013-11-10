class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :title, :content, :user_id, :post_id, presence: true
end
