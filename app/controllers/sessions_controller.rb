class SessionsController < ApplicationController 

  def new 
    @user = User.new
    render layout: 'login'
  end

  def create 
    @user = User.find_by(name: params[:user][:name])
      if @user 
        session[:user_id] = @user.id
          redirect_to home_path
      else 
        redirect_to signup_path
      end
  end

  def destroy 
    log_out
    redirect_to root_path
  end

end