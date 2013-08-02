class Wishlist < ActiveRecord::Base
  attr_accessible :item_id, :user_id

  belongs_to :user
  has_many :items, dependent: :destroy


  validates :user_id, presence: true

  def items
  	Item.find_by_wishlist_id(self.id)
  end

  def item
  	item=Item.new
  end
end
