class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :correct_user, only: [:destroy]

  def destroy
    @photo.destroy   
    respond_to :js
  end 

  private
  def correct_user
    @photo = Photo.find(params[:id])
    @post = current_user.posts.find_by(id: @photo.post)
    redirect_to root_url unless @post
  end
end
