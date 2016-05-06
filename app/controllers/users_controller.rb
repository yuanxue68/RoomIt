class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:favorite, :crop]

  def show
    @user = User.find(params[:id])
  end

  def crop
    @user = current_user
  end

  def favorite
  end 

end

