class User < ActiveRecord::Base
	has_many :posts, { foreign_key: :author_id }
	has_many :comments, { foreign_key: :commenter_id }

	validates :username, :email, :hashed_password, { presence: true }
	validates :username, :email, { uniqueness: true }

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password)
  	self.password == password
  end

end