class SessionsController < ApplicationController


    def new
        @user = User.new
        render :login
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/login'
            #if you want to be less secure and have fields show the previous attempted info, 
            #use the render.  You will then have to change the login page to form_tag or maybe form_with?
        end
    end

    def home

    end

    def destroy
        session.clear
        redirect_to '/'
    end
end
