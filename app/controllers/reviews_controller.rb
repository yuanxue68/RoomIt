class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @user = User.find(params[:user_id])
    @review = current_user.reviews_written.build(
      content: review_params[:content],
      receiver: @user
    )
    if @review.save
      respond_to do |format|
        format.html {redirect_to user_path(@reivew.receiver)}
        format.js
      end
    else  
      flash[:failure] = "An error has occured while saving review"
      redirect_to user_path(receiver)
    end
  end

  def destroy
    @review.destroy
  end

  private

  def correct_user
    @review = current_user.reviews_written.find_by(id: params[:id])
    redirect_to root_path if @review.nil?
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
