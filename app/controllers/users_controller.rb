class UsersController < ApplicationController
  def new
    @user = User.new
    @post = Post.new
  end

  def create
    @user = User.new(params[:user])
    if @user.password == @user.password_confirmation && @user.save
      login @user
      redirect_to feed_url
    else
      set_flash "Invalid something or other."
      render :new
    end
  end

  def feed
    @posts = current_user.sectors.map{ |s| s.posts }.flatten.uniq.reverse
  end
end
