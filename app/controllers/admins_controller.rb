class AdminsController < ApplicationController
  before_action :user_is_admin


  def index

  end

  def show
       @user = User.find(params[:id])
       @professor = Professor.where("flag > ?", 0).order("flag DESC")
       @review = Review.where("flag > ?", 0).order("flag DESC")
  end




  private

  def user_is_admin
    redirect_to root_url unless current_user.try(:admin?)
    flash[:error] = "You must be logged in as Admin to come to this party"
  end
end
