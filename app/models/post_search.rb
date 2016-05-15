class PostSearch
  def initialize(search_params)
    @address = search_params[:address]
    @bedroom = search_params[:bedroom] 
    @bathroom = search_params[:bathroom]
    @minRent = search_params[:minRent]
    @maxRent = search_params[:maxRent]
    @home_type = search_params[:home_type]
    @room_type = search_params[:room_type]
    @has_air = search_params[:has_air]
    @has_tv = search_params[:has_tv]
    @has_heating = search_params[:has_heating]
    @has_kitchen = search_params[:has_kitchen]
    @has_internet = search_params[:has_internet]
    @title = search_params[:title]
    if(search_params[:swLat] && search_params[:swLng] && search_params[:neLat] && search_params[:neLng])
      @bound = [search_params[:swLat], search_params[:swLng], search_params[:neLat], search_params[:neLng]]
    end
  end

  def posts
    @posts ||= search_posts    
  end

  private
  def search_posts
    posts = Post.order('created_at DESC')
    posts = posts.near(@address, 25) if @address && !@address.empty?
    posts = posts.where(bedroom: @bedroom) if @bedroom && !@bedroom.empty?
    posts = posts.where(bathroom: @bathroom) if @bathroom && !@bathroom.empty?
    posts = posts.where("title LIKE ?", "%#{@title}%") if @title && !@title.empty?
    posts = posts.where("price>?", @minRent) if @minRent && !@minRent.empty?
    posts = posts.where("price<?", @maxRent) if @maxRent && !@maxRent.empty?
    posts = posts.where(home_type: @home_type) if @home_type && !@home_type.empty?
    posts = posts.where(room_type: @room_type) if @room_type && !@room_type.empty?
    posts = posts.where(has_air: @has_air) if @has_air && !@has_air.empty?
    posts = posts.where(has_tv: @has_tv) if @has_tv && !@has_tv.empty?
    posts = posts.where(has_heating: @has_heating) if @has_heating && !@has_heating.empty?
    posts = posts.where(has_kitchen: @has_kitchen) if @has_kitchen && !@has_kitchen.empty?
    posts = posts.where(has_internet: @has_internet) if @has_internet && !@has_internet.empty? 
    posts = posts.within_bounding_box(@bound) if @bound && !@bound.empty?
    posts 
  end

end
