class SessionsController < ApplicationController



    def new

    end

    def create

        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password])

        if user.nil?
            flash[:error] = "Username/Password not valid"
            render :new
            # redirect_to new_session_path
        else
            login!(user)
            flash[:notice] = "Welcome back #{user.username}"
            redirect_to user_path(user)
        end
    end



    def destroy
        logout!
        redirect_to new_session_url


    end
end
