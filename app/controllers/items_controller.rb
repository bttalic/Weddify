class ItemsController < ApplicationController
	before_filter :signed_in_user #, :correct_user

	def new
		if !@item
			redirect_to current_user
		end
	end

	def create
		@item = Item.new(params[:item])
		@item.wishlist_id=current_user.wishlist.id
		@item.user_id = current_user.id
		if @item.save
			flash[:green] = t('item_added')
			redirect_to current_user
		else
			@items=Item.find_all_by_user_id(current_user.id)
			render 'new'
		end
	end

	def destroy
		
		@item=Item.find(params[:id]).destroy
		flash[:success] = t('item_deleted')
		redirect_to current_user
	end



end