class UsersController < ApplicationController
  layout 'application'

  before_action :confirm_logged_in, :except => [:login, :login_attempt, :logout]

  def index

  end

  def login
  
  end

  def login_attempt

   if params[:username].present? && params[:password].present?
      user = AdminUser.where(:username => params[:username]).first
      if user 
        authorization = user.authenticate(params[:password])
      end
    end
    if authorization
      session[:user_id] = authorization.id
      session[:username] = authorization.username
      flash[:success] = 'Login Successfully'
      redirect_to(:action => 'index')
    else
      flash[:error] = 'Incorrect username or password'
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to(:action => 'login')
  end

end
