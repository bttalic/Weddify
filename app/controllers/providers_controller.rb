class ProvidersController < ApplicationController
	before_filter :signed_in_user, only: [:edit, :update]
	#before_filter :correct_user, only: [:edit, :update]
	#before_filter :admin_user, only: :destroy

	def new
		@provider=Provider.new
		

	end

	def show
		@provider=Provider.where("lower(name) =?" ,params[:name]).first
		if @provider == nil
			@provider = Provider.find_by_id(params[:id])
		end

		if !@provider || @provider == nil
			redirect_to root_path
			return
		end

		@story = Story.find_by_provider_id(@user.id)
		@items=Item.find_all_by_provider_id(@user.id)
		@photos = @provider.gallery.photos
	end

	def create
		@provider = Provider.new(params[:provider])
		if @provider.save
			story = Story.new
			story.user_id = @provider.id
			story.story_text = t('tell_your_story')
			@provider.story = story
			@provider.story.save
			@provider.gallery=Gallery.new
			sign_in @provider
			flash[:green] = t('created_profile')
			redirect_to @provider
		else
			render 'new'
		end
	end

	private
	def correct_user
		@provider = Provider.find(params[:id])
		redirect_to(root_url) unless current_user?(@user)
	end


end
