class UsersController < ApplicationController 
    before_action :find_user, only: [:index, :show]

    def index
      users = User.all 
      respond_to do |format|
        format.html
        format.json { render :json => users.to_json }
      end
    end

    def new 
      @user = User.new
    end

    def create
      user = User.new(name: params[:name], email: params[:email], password_digest: params[:password_digest])
      if user.save 
        redirect_to users_path
      else 
        flash[:error] = "Please Try Again."
        redirect_to signup_path 
      end
    end

    def search 
      flash[:success] = "You made it"
    end

    def show 
      @user = User.find(params[:id])
    end

    def destroy 
      log_out 
      redirect_to root_path
    end

end