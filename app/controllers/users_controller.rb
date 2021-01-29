class UsersController < ApplicationController
    before_action :require_current_user, except: [:new, :create]

    def index
        @users = User.all
        @user = User.new

    end

    def new
        @user = User.new
    end
    # def create
        # @user = User.new(user_params)

        # if @user.save
        #     login!(@user)
        #     flash[:notice] = "Welcome #{@user.username}"
        #     redirect_to user_path(@user)
        # else
        #     flash.now[:errors] = @user.errors.full_messages
        #     render :new
        # end

    # end

    def create
        @user = User.new(user_params)
    
        respond_to do |format|
          if @user.save
            format.html { redirect_to @user, notice: 'User was successfully created.' }
            format.js
            format.json { render json: @user, status: :created, location: @user }
          else
            format.html { render action: "new" }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

    def show
        @user = User.find(params[:id])
    end

    def update
        @user  = User.find(params[:id])

        respond_to do |format|
            if @user.update(username: params[:user][:username])
                format.html { redirect_to @user, notice: 'User has been updated.'}
                format.js
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: "new" }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @user  = User.find(params[:id])
        if @user.destroy
            respond_to do |format|
                format.html { redirect_to @user, notice: "user has been deleted." }
                format.js
                format.json { render json: @user, status: :deleted, location: @user}
            end
        end
    end




    private 
    
    def user_params
        params.require(:user).permit(:username, :password, :email, :full_name, :profile_picture)
    end
end
