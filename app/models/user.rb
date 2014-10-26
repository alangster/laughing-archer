class User < ActiveRecord::Base

	has_many :posts, foreign_key: :author_id
	has_many :comments
	has_many :commented_posts, through: :comments, source: :post

	def password
		@password ||= BCrypt::Password.new(password_hash)
	end

	def password=(new_password)
		@password = BCrypt::Password.create(new_password)
		self.password_hash = @password
	end

end
