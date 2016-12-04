class User < ActiveRecord::Base
	has_many :posts, { foreign_key: :author_id }
	has_many :comments, { foreign_key: :commenter_id }

	validates :username, :email, :password_digest, { presence: true }
	validates :username, :email, { uniqueness: true }

  has_secure_password
  # def password
  #   @password ||= BCrypt::Password.new(hashed_password)
  # end

  # def password=(new_password)
  #   @password = BCrypt::Password.create(new_password)
  #   self.hashed_password = @password
  # end

  # def authenticate(password)
  # 	self.password == password
  # end

end