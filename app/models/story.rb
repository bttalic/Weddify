class Story < ActiveRecord::Base
  attr_accessible :story_text, :user_id
  belongs_to :user, dependent: :destroy

  validates :story_text, presence: true
  validates :user_id, presence: true

end