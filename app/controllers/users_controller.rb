class UsersController < ApplicationController
    before_action :require_current_user, except: [:new, :create]

    def index

    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            flash[:notice] = "Welcome #{@user.username}"
            redirect_to user_path(@user)
        end

    end

    def show
        @user = User.find(params[:id])

    end



    private 
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
