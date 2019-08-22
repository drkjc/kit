class RoomsController < ApplicationController 
    # before_action :find_user 
    
    def index
        @rooms = Room.all
        @room = Room.new
    end 

    def new; end 

    def create 
        room = Room.new(room_params)
        if room.save
            render json: room, status: 201
        else
            render json: room, status: :bad_request
        end
        # room_name = params[:name] + "-" + @user.name
        # room = Room.find_by(name: params[room_name])
        # if !room
        #     room_name = params[:name] + "-" + @user.name
        #     room = @user.rooms.build(name: room_name)
        #     room.save 
        #     render json: room 
        # elsif !params[:room][:name].empty?
        #     room = @user.rooms.build(room_params)
        #     @user.save
        #     render json: room
        # else
        #     render json: room, status: :bad_request
        # end
    end 

    def show 
        room = Room.friendly.find(params[:id])
        @message = Message.new
        render json: room
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