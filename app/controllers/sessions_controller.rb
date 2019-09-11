class SessionsController < ApplicationController 

  def new 
    @user = User.new
    render layout: 'login'
  end

  def create 
    if params[:provider]
      @user = User.find_or_create_by(email: oauth[:info][:email]) do |u|
        u.name = oauth[:info][:name]
        u.email = oauth[:info][:email]
        u.password_digest = SecureRandom.hex 
      end 
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to home_path 
      else 
        redirect_to signup_path
      end
    else 
      @user = User.find_by(name: params[:user][:name])
      if @user 
        session[:user_id] = @user.id
        redirect_to home_path
      else 
        redirect_to signup_path
      end
    end
  end

  def destroy 
    log_out
    redirect_to root_path
  end

  private 

  def oauth
    request.env['omniauth.auth']
  end

end