class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :post

	validates :body, :commenter_id, :post_id, { presence: true }

end