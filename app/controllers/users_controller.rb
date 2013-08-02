class UsersController < ApplicationController

	before_filter :signed_in_user, only: [:edit, :update]
	before_filter :correct_user, only: [:edit, :update]
	before_filter :admin_user, only: :destroy

	def new
		@user=User.new
	end

	def show
		@user=User.where("lower(name_groom) =? AND lower(name_bride) =? AND lower(last_name) =? " ,params[:name_groom], params[:name_bride], params[:last_name]).first
		if @user == nil
			@user = User.find_by_id(params[:id])
		end

		if !@user || @user == nil
			redirect_to root_path
			return
		end

		@story = Story.find_by_user_id(@user.id)
		@items=Item.find_all_by_user_id(@user.id)
		@photos = @user.gallery.photos
	end

	def create
		@user = User.new(params[:user])
		if @user.save
			@user.wishlist=Wishlist.new
			@user.wishlist.user_id=@user.id
			@user.wishlist.save
			story = Story.new
			story.user_id = @user.id
			story.story_text = t('tell_your_story')
			@user.story = story
			@user.story.save
			@user.gallery=Gallery.new
			sign_in @user
			flash[:green] = t('created_profile')
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		if @user.update_attributes(params[:user])
			flash[:green] = t('profile_updated')
			sign_in @user
			redirect_to @user
		else
			render 'edit'
		end
	end

	def index
		@users = User.paginate(:page => params[:page], :per_page => 20)
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:green] = t('user_deleted')
		redirect_to root_path #users_path
	end

	private
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end

	
	def admin_user
		redirect_to(root_path) unless current_user.admin?
	end


end
