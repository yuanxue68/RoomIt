class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def index
    @posts = current_user.favorite_posts
  end

  def create
    post = Post.find(params[:post])
    @favorite = current_user.favorites.build(post: post)
    if @favorite.save
      render json: {id: @favorite.id}
    else 
      render json: @favorite.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @favorite.destroy
    render json: {id: params[:id]}
  end

  private
  def correct_user
    @favorite = current_user.favorites.find(params[:id])
    redirect_to root_path if @favorite.nil?
  end
end
