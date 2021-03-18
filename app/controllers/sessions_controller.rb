class SessionsController < ApplicationController
    def new
        # don't need an instance variable as not creating a new user
        render :login
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:message] = "You have entered incorrect email and/or password, please try again."
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

    def omniauth
        @user = User.from_omniauth(auth)
        if @user
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else 
            flash[:message] = "Unable to find this login information, please sign up with your email"
            redirect_to signup_path
        end
    end
      
    private
      
    def auth
       request.env['omniauth.auth']
    end
end
