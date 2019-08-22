class MessagesController < ApplicationController 
    before_action :find_user

    def index 
    end

    def new 
    end

    def show 
    end
    
    def create
        if !params[:message][:content].empty?
            room = Room.find_by(name: params[:room_id])
            message = room.messages.build(message_params)
            @user.messages << message
            room.save
            redirect_to room_path(room)
        else
            redirect_to rooms_path
        end
    end

    private 

    def message_params 
        params.require(:message).permit(:content)
    end

end