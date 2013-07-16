class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    ensure_current_user(@post.user_id)
    if @post.save
      redirect_to @post
    else
      set_flash "Could not save post"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

end