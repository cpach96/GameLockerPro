class UsersController < ApplicationController

    def index

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @post.save
        redirect_to user_path(@user)

    end

    def show
        
    end

    private
    ## Required params to pass username and password as password_digest
    def user_params
        params.require(:user).permit(:username, :password_digest)
    end
end
