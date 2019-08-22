class RoomsController < ApplicationController 
    before_action :find_user 
    
    def index
        @rooms = Room.all
        @room = Room.new
    end 

    def new; end 

    def create 

        room_name = params[:name] + "-" + @user.name
        room = Room.find_by(name: params[room_name])
        if !room
            room_name = params[:name] + "-" + @user.name
            room = @user.rooms.build(name: room_name)
            room.save 
            redirect_to room_path(room)
        elsif !params[:room][:name].empty?
            room = @user.rooms.build(room_params)
            @user.save
            redirect_to room_path(room)
        else
            redirect_to rooms_path
        end
    end 

    def show 
        @room = Room.friendly.find(params[:id])
        @message = Message.new
    end 

    def edit 

    end 

    def destroy 

    end

    private 

    def room_params 
        params.require(:room).permit(:name)
    end

end