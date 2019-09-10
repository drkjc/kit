class SessionsController < ApplicationController 

  def new 
    @user = User.new
    render layout: 'login'
  end

  def create 
    #raise params.inspect
    @user = User.find_by(name: params[:user][:name])
      if @user 
        session[:user_id] = @user.id
          redirect_to users_path
      else 
        redirect_to signup_path
      end
  end

  def destroy 
    log_out
    redirect_to root_path
  end

end