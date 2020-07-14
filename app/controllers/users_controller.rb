class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def index
        
    end

    def new
        @user = User.new
        render :layout => false

    end

    def create
        @user = User.new(user_params)
        if @user.valid?
        @user.save
        redirect_to login_path

        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    ## Required params to pass username and password as password_confirmation
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
