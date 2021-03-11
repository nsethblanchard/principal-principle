class ApplicationController < ActionController::Base

    #put methods in here you will use in your controllers primarily and use a lot
    #if you are planning to just use them in views, write them in the appropriate helper file and then "include" them here

    
    #the 'helper_method' just gives permission for these methods to be used in the views
    helper_method :current_user, :logged_in?


    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    #potentially add a redirect_if_not_logged_in type of method, then add to user actions
end
