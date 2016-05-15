module ApplicationHelper
  
  def avatar_url(user)
    if user.avatar.present?
      user.avatar.url(:medium)
    else
      "user.png"
    end
  end

  def post_thumb(post)
    if post.photos.empty?
      "no_picture.png"
    else 
      post.photos.first.image.url(:medium)
    end
  end
end
