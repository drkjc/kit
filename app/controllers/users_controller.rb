class UsersController < ApplicationController 

    def index 
    end

    def new 
        @user = User.new
    end

    def show 
        @user = User.find(params[:id])
    end

    def destroy 
        log_out 
        redirect_to root_path
    end

end