class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email_groom(params[:session][:email].downcase)
    if !user
      user = User.find_by_email_bride(params[:session][:email].downcase)
    end
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = t('invalid_login_data')
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end