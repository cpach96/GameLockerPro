class UsersController < ApplicationController

    def index

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
        @user.save
        redirect_to user_path(@user)

        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    ## Required params to pass username and password as password_digest
    def user_params
        params.require(:user).permit(:username, :password_digest)
    end
end
