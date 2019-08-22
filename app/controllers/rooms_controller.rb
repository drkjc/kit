class RoomsController < ApplicationController 
    before_action :find_user 
    
    def index
        @rooms = Room.all
        @room = Room.new
    end 

    def new; end 

    def create 
        raise params.inspect
        if !params[:contact_id]

        if !params[:room][:name].empty? && params[:user_id]
            room = @user.rooms.build(room_params)
            @user.save
            redirect_to room_path(room)
        else
            redirect_to rooms_path
        end
    end 

    def show 
        @room = Room.find(params[:id])
        @message = Message.new
    end 

    def edit 

    end 

    def destroy 

    end

    private 

    def room_params 
        params.require(:room).permit(:name, :user_id)
    end

end