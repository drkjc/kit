class ApplicationController < ActionController::Base

    def find_user 
        @user ||= User.first
    end



    
end
