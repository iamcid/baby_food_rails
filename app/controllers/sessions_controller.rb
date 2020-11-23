class SessionsController < ApplicationController

    def welcome
    end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "Invalid credentials. Please try again."
            redirect_to login_path
        end
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            flash[:message] = "Could not log in with Google, please try again!"
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to '/'
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end