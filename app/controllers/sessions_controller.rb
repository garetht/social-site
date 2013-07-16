class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      login @user
      redirect_to @user
    else
      set_flash "Invalid something or other in session."
      render :new
    end
  end

  def destroy
  end
end