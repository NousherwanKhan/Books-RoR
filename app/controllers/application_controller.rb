class ApplicationController < ActionController::Base

    private
    def confirm_logged_in
    unless session[:user_id]
      flash[:error] = 'You must login first'
      redirect_to(:controller => 'users', :action => 'login')
      return false
    else
      return true
    end
  end
end
