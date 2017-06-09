class UsersController < ApplicationController
before_action :user_is_admin
  def search
    @users = User.all
    if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order('created_at DESC')
    end
  end


  def admin
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(:admin)
      flash[:success]= "Made admin"
    else
      render 'search'
    end
  end

  def toggle_admin
    @user = User.find_by_id(params[:id])
    @user.admin = true
    @user.save
    redirect_to users_search_path
  end

private


  def user_is_admin
    unless current_user.try(:admin?)
      redirect_to root_url
      flash[:error] = "You must be logged in as Admin to come to this party"
    end
  end


end
