class Gallery < ActiveRecord::Base
  attr_accessible :photo_id, :user_id

  belongs_to :user
  has_many :photos, dependent: :destroy

  validate :user_id_or_provider_id

  def user_id_or_provider_id
  	if !self.user_id && !self.provider_id
  		 errors[:base] << ("Doslo je do greske")
    end
end

end
