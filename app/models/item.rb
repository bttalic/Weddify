class Item < ActiveRecord::Base
	attr_accessible :link, :name, :priority, :wishlist_id, :user_id


	validates :name, presence: true
	validates :priority, presence: true, :inclusion => 1...11
	validates :wishlist_id, presence: true
	validates :user_id, presence: true


	belongs_to :wishlist
end
