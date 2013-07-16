class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to feed_url
    else
      set_flash "Invalid something or other in session."
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
