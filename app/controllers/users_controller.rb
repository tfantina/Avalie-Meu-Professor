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
    @user = User.find(params[:id])
    if !@user.admin?
        @user.admin = true
        @user.save
        flash.now[:notice] = "User is now admin!"
    else
      @user.admin = false
      @user.save
      flash.now[:notice] = "User is not admin"
    end
  end


private


  def user_is_admin
    unless current_user.try(:admin?)
      redirect_to root_url
      flash[:error] = "You must be logged in as Admin to come to this party"
    end
  end


end
