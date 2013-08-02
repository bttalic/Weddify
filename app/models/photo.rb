class Photo < ActiveRecord::Base
  attr_accessible :image, :title, :gallery_id
  has_attached_file :image, dependent: :destroy
  belongs_to :gallery

  validates :gallery_id, presence: true
  validate :check_content_type

  def check_content_type
    if !['image/jpeg', 'image/gif','image/png'].include?(self.image_content_type)
      errors[:base] << ("Slika '#{self.avatar_file_name}' nema validnu ekstenziju, koristite img, gif ili png")
    end
  end 
  #validates :title, presence: true

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:image_file_name),
      "size" => read_attribute(:image_file_size),
      "url" => image.url(:original),
      "delete_url" => photo_path(self),
      "delete_type" => "DELETE" 
    }
  end

end
