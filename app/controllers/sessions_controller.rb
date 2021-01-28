class SessionsController < ApplicationController


    def create

        user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password])

        if user.nil?
            flash[:errors] = user.errors.full_messages
        else
            login!(user)
            redirect_to user_path(user)

        end

    end

    def new

    end

    def destroy
        logout!
        redirect_to new_session_url


    end
end
