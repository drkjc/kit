class RoomsController < ApplicationController 

    def index
        @rooms = Room.all
        @room = Room.new
    end 

    def new; end 

    def create 
        @room = Room.create(room_params)
        redirect_to rooms_path
    end 

    def show 
        @room = Room.find(params[:id])
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