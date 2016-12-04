class User < ActiveRecord::Base
	has_many :posts, { foreign_key: :author_id }
	has_many :comments, { foreign_key: :commenter_id }

	validates :username, :email, :hashed_password, { presence: true }
	validates :username, :email, { uniqueness: true }

end