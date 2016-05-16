class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if request.format.html?
      @coordinate = params[:location] ? Geocoder.coordinates(params[:location]) : nil
      if params[:view] == "list"
        @posts = Post.includes(:photos).search_listing(params).page(params[:page]).per(12)
        render 'posts/index_list'
      else
        render 'posts/index'
      end
    else
      @posts = Post.includes(:photos).search_listing(params)
      render json: @posts.to_json({ include: {photos: {only:[], methods: [:image_url]}}})
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
    @favorited = current_user.favorites.find_by(post: params[:id])
    @nearby = @post.nearbys(5).limit(4)
  end

  def edit
    @photos = @post.photos
  end

  def update
    if @post.update(post_params)
      if params[:images]
        params[:images].each do |image|
          @post.photos.create(image: image)
        end
      end
      flash[:notice] = "Post Successfully Updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
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
      :price, :available_date
    )
  end
end
