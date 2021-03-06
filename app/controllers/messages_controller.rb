class MessagesController < ApplicationController 
    before_action :find_user
    skip_before_action :verify_authenticity_token

    def show 
      message = Message.find(params[:id])
      render json: message, status: 201
    end
    
    def create
        if !params[:message][:content].empty?
            room = Room.find_by(name: params[:message][:id])
            message = Message.new(content: params[:message][:content])
            message.room = room
            message.user = @user
            message.username = @user.name
            message.save
            render json: message, status: 201
        else
            redirect_to rooms_path
        end
    end

end