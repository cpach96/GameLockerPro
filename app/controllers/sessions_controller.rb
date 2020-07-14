class SessionsController < ApplicationController

    def new
        render :layout => false
    end

    def create
        #this checks to see if you typed a username in the params field for username and logs you in while bypassing the omni auth sign in while still allowing for validations within the model.
        if params[:username]
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(current_user)

        else
        #This is the OmniAuth part that authorizes use of github 
        auth = request.env["omniauth.auth"]  
        user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)     
        session[:user_id] = user.id     
        redirect_to root_url, :notice => "Signed in!"
        end
    end

    def destroy
        session.delete :user_id
        redirect_to login_path
    end

end