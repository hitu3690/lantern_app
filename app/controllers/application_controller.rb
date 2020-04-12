include SessionsHelper
class ApplicationController < ActionController::Base
  
  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:warning] = 'ログインしてください'
        redirect_to login_url
      end
    end
end
