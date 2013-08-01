class WishlistsController < ApplicationController
	before_filter :signed_in_user #, :correct_user

def new
	Wishlist.new
end

def create
  if current_user.wishlist
    @wishlist = current_user.wishlist
  else
    @wishlist = Wishlist.new
  end

  @wishlist.user_id = current_user.id
  @wishlist.user_id=current_user.id
  if @wishlist.save
  	redirect_to current_user
  end
end

def update
  if current_user.wishlist
    @wishlist = current_user.wishlist
  else
    @wishlist = Wishlist.new
    @wishlist.user_id=current_user.id
  end

  if current_user.wishlist.update_attributes(params[:wishlist])
      redirect_to current_user
  else
    respond_with "error"
  end
end


end