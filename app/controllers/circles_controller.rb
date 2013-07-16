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

  def edit
    @circle = Circle.find(params[:id])
  end

  def update
    @circle = Circle.find(params[:id])
    ensure_current_user(@circle.user_id)
    if @circle.update_attributes(name: params[:circle][:name],
                         user_id: params[:circle][:user_id])
      @circle.update_attribute(:friend_ids, params[:circle][:friend_ids])
      redirect_to @circle
    else
      set_flash "#{@circle.errors.full_messages}"
      render :new
    end

  end

  def destroy
  end

  def show
    @circle = Circle.find(params[:id])
  end
end
