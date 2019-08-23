class RoomsController < ApplicationController 
    before_action :find_user 
    skip_before_action :verify_authenticity_token
    
    def index
        @rooms = Room.all
        @room = Room.new
        render json: @rooms, status: 201
    end 

    def new

    end 

    def create 
        room = @user.rooms.build(name: params[:channel][:name])
        room.name = room.name.split.join('-')
        if @user.save
            binding.pry
            render json: room, status: 201
        else
            render json: room, status: :bad_request
        end
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