class ApplicationController < ActionController::Base


   def authentication_required
    if !logged_in?
        redirect_to login_path
    end
   end

   def logged_in?
    !!current_user
   end

   def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
   end

   private
 
   def require_login
     unless logged_in?
       flash[:error] = "You must be logged in to access this section"
       redirect_to root_url # halts request cycle and sends to login
     end
   end

   helper_method :current_user
end
 