class SessionsController < ApplicationController 

    def new 
        @user = User.new
    end

    def create 
        @user = User.find_by(name: params[:user][:name])

        if @user 
            redirect_to user_path(@user)
        else 
            redirect_to signup_path
        end
    end

end