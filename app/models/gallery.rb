class Gallery < ActiveRecord::Base
  attr_accessible :photo_id, :user_id

  belongs_to :user
  has_many :photos, dependent: :destroy

  validates :user_id, presence: true


end
