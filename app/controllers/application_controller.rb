class ApplicationController < ActionController::Base
  
    def find_user 
        @user ||= User.find(session[:user_id])
    end

    def log_out
        session.delete(:user_id)
    end



    
end
