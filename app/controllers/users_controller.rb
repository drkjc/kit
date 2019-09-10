class UsersController < ApplicationController 
    before_action :find_user, only: [:index, :show, :search, :settings]
    

    def show 
      @user = User.find(params[:id])
    end

    def index
      @message = Message.new
      users = User.all 
      respond_to do |format|
        format.html
        format.json { render :json => users.to_json }
      end
    end

    def new 
      @user = User.new
      render layout: 'login'
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
      render layout: 'login' 
      @users = User.all
    end

    def settings
      #binding.pry 
      render json: @user, status: 201
    end


    def destroy 
      log_out 
      redirect_to root_path
    end

end