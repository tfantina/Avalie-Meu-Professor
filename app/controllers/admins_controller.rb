class AdminsController < ApplicationController
   before_action :require_login
   before_action :user_is_admin


  def index


  end

  def show
       @user = User.find(params[:id])
       @professor = Professor.where("flag > ?", 0).order("flag DESC")
  end



  private

  def set_user


  end

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in as Admin to come to this party"
      redirect_to login_url
    end
  end

  def user_is_admin
    redirect_to root_url unless current_user.admin?
  end
end
