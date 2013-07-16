class CirclesController < ApplicationController

  def new
    @circle = Circle.new
  end

  def create
    @circle = Circle.new(name: params[:circle][:name],
                         user_id: params[:circle][:user_id])
    ensure_current_user(@circle.user_id)
    if @circle.save
      @circle.update_attribute(:friend_ids, params[:circle][:friend_ids])
      redirect_to @circle
    else
      set_flash "#{@circle.errors.full_messages}"
      render :new
    end
  end

  def ensure_current_user(id)
    unless current_user.id == id
      logout
      set_flash "Stop hacking us!"
      redirect_to new_session_url
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
    @circle = Circle.find(params[:id])
  end
end
