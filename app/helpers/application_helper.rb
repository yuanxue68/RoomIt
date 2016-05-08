module ApplicationHelper
  
  def avatar_url(user)
    if user.avatar.present?
      user.avatar.url(:medium)
    else
      "user.png"
    end
  end
end
