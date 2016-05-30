class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :crop, :my_posts]

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews_received.includes(:giver)
  end

  def my_posts
    @posts = current_user.posts.includes(:photos).page(params[:page]).per(12)
  end

  def crop
    @user = current_user
  end

  def favorite
  end 

end

