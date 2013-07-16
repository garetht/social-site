class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.password == @user.password_confirmation && @user.save
      login @user
      redirect_to @user
    else
      set_flash "Invalid something or other."
      render :new
    end
  end

  def show
  end
end
