class PostSearch
  def initialize(search_params)
    @bedroom = search_params[:bedroom] 
    @bathroom = search_params[:bathroom]
    @minRent = search_params[:minRent]
    @maxRent = search_params[:maxRent]
    @title = search_params[:title]
    @order = search_params[:order] || :created_at
    if(search_params[:swLat] && search_params[:swLng] && search_params[:neLat] && search_params[:neLng])
      @bound = [search_params[:swLat], search_params[:swLng], search_params[:neLat], search_params[:neLng]]
    end
  end

  def posts
    @posts ||= search_posts    
  end

  private
  def search_posts
    posts = Post.order(@order)
    posts = posts.where(bedroom: @bedroom) if @bedroom && !@bedroom.empty?
    posts = posts.where(bathroom: @bathroom) if @bathroom && !@bathroom.empty?
    posts = posts.where(title: @title) if @title && !@title.empty?
    posts = posts.where("price>?", @minRent) if @minRent && !@minRent.empty?
    posts = posts.where("price<?", @maxRent) if @maxRent && !@maxRent.empty?
    posts = posts.within_bounding_box(@bound) if @bound && !@bound.empty?
    posts 
  end

end
