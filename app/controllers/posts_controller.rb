class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if request.format.html?
      @coordinate = params[:location] ? Geocoder.coordinates(params[:location]) : nil
      if params[:view] == "list"
        @posts = Post.search_listing(params).page(params[:page]).per(10)
        render 'posts/index_list'
      else
        render 'posts/index'
      end
    else
      @posts = Post.search_listing params 
      render json: @posts
    end
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      if params[:images]
        params[:images].each do |image|
          @post.photos.create(image:image)
        end
      end
      flash[:success] = "Posting successfully Created"
      redirect_to posts_path
    else
      render "posts/new"
    end
  end

  def show
    @post = Post.includes(:photos).find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end

  def search_params
    params.require(:search).permit(:title, :bedroom, :bathroom, :swLat, :swLng, :neLat, :neLng, :minRent, :maxRent)
  end

  def post_params
    params.require(:post).permit(
      :title, :description, :home_type, :room_type, :bedroom, 
      :bathroom, :street_address, :city, :province, :postal_code,
      :has_tv, :has_kitchen, :has_air, :has_heating, :has_internet, 
      :price
    )
  end
end
