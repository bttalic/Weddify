class Story < ActiveRecord::Base
  attr_accessible :story_text, :user_id, :provider_id
  
  belongs_to :user
  belongs_to :provider

  validates :story_text, presence: true
  validate :user_id_or_provider_id

  def user_id_or_provider_id
  	if !self.user_id && !self.provider_id
  		 errors[:base] << ("Doslo je do greske")
    end
end
end
