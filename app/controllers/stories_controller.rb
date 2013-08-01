class StoriesController < ApplicationController
	before_filter :signed_in_user #, :correct_user

def new
	Story.new
end

def create
  if current_user.story
    @story = current_user.story
  else
    @story = Story.new
  end

  @story.story_text = params[:story]
  @story.user_id=current_user.id
  if @story.save
  	redirect_to current_user
  end
end

def update
  if current_user.story
    @story = current_user.story
  else
    @story = Story.new
    @story.user_id=current_user.id
  end

  if current_user.story.update_attributes(params[:story])
      redirect_to current_user
  else
    flash[:danger] = t('empty_story')
   redirect_to current_user
  end
end


end