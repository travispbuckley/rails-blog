class Post < ActiveRecord::Base
	has_many :comments
	belongs_to :author, { class_name: "User" }

	validates :title, :body, :author_id, { presence: true }

end