class Admin::UsersController < ApplicationController
  
  layout "admin"
  
  def index
    @users = User.order("created_at").page(params[:page]).per(5)# User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user), notice: 'User was successfully updated.' 
    else
      render action: "edit" 
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to admin_users_url 
  end
end
