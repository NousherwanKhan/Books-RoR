class AdminUsersController < ApplicationController

  before_action :confirm_logged_in

  def index
    @users = AdminUser.sorted
  end

  def new
    @user = AdminUser.new
  end

  def create
    @user = AdminUser.new(user_params)
    if @user.save
      flash[:success] = 'User Added Successfully'
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def edit
    @user = AdminUser.find(params[:id])
  end

  def update
    @user = AdminUser.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'User data Updated successfully'
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def destroy
    @user = AdminUser.find(params[:id]).destroy
    flash[:success] = 'User deleted Successfully'
    redirect_to(:action => 'index')
  end

  private
  def user_params
    params.require(:admin_user).permit(:first_name, :last_name, :username, :email, :password)
  end
end
