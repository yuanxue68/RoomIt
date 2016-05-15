class HomePagesController < ApplicationController
  def index
    @posts = Post.includes(:photos).order('created_at DESC').limit(6)
  end
end
