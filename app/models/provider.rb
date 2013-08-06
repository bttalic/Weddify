class Provider < ActiveRecord::Base
	attr_accessible :category, :email, :name, :password_digest, :password, :password_confirmation, :avatar
	has_attached_file :avatar, dependent: :destroy

	def check_content_type
		if !['image/jpeg', 'image/gif','image/png'].include?(self.avatar_content_type)
			errors[:base] << ("Slika '#{self.avatar_file_name}' nema validnu ekstenziju, koristite img, gif ili png")
		end
	end 

	has_secure_password

	before_save { |user| user.email = email.downcase}
	before_save :create_remember_token
	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true,
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true

	validates :category, presence: true, :inclusion => 1...5

	has_one :story, dependent: :destroy
	has_one :gallery, dependent: :destroy

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
