class Image < ActiveRecord::Base
	attr_accessible :description, :title
	has_attached_file :image, dependent: :destroy

	validate :check_content_type
	

	validates :title, presence: true
	validates :gallery_id, presence: true

	def check_content_type
		if !['image/jpeg', 'image/gif','image/png'].include?(self.image_content_type)
			errors[:base] << ("Slika '#{self.avatar_file_name}' nema validnu ekstenziju, koristite img, gif ili png")
		end
	end 

end
