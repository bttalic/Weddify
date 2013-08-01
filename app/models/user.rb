class User < ActiveRecord::Base

	attr_accessible :name_groom, :name_bride, :email_groom, :email_bride, :last_name, :password, :password_confirmation, :avatar
	has_attached_file :avatar, dependent: :destroy
	validate :check_content_type

	has_secure_password

	def check_content_type
		if !['image/jpeg', 'image/gif','image/png'].include?(self.avatar_content_type)
    errors[:base] << ("Slika '#{self.avatar_file_name}' nema validnu ekstenziju, koristite img, gif ili png") # or errors.add
end
end 

before_save { |user| user.email_groom = email_groom.downcase}
before_save { |user| user.email_bride = email_bride.downcase}

before_save :create_remember_token

validates :name_groom, presence: true, length: { maximum: 50 }
validates :name_bride, presence: true, length: { maximum: 50 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email_groom, presence: true,
format: { with: VALID_EMAIL_REGEX },
uniqueness: { case_sensitive: false }
validates :email_bride, presence: true,
format: { with: VALID_EMAIL_REGEX },
uniqueness: { case_sensitive: false }

validates :password, presence: true, length: { minimum: 6 }
validates :password_confirmation, presence: true

validates :last_name, presence: true


has_one :story, dependent: :destroy
has_one :wishlist, dependent: :destroy

private
def create_remember_token
	self.remember_token = SecureRandom.urlsafe_base64
end
end

