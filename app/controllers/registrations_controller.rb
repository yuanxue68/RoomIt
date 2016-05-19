class RegistrationsController < Devise::RegistrationsController
  
  def update_resource(resource, params)
    resource.update_without_password(account_update_params)
  end

  private
  
  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :display_name, :avatar, :phone, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :display_name, :avatar, :phone, :crop_x, :crop_y, :crop_w, :crop_h)
  end

  def after_update_path_for(resource)
    if params[:user][:avatar].blank?
      user_path(resource)
    else
      crop_user_path(resource)
    end
  end
end
