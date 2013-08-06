class GalleriesController < ApplicationController
  #before_filter :signed_in_user #, :correct_user

def show
	@photos = current_user.gallery.photos
end


end