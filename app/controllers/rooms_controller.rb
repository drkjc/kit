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
      if params[:user_name] 
        room_name = @user.name + '-' + params[:user_name]
        room = Room.friendly.find_by(name: room_name)
        if room 
          redirect_to rooms_path(room)
        else
          room = @user.rooms.build(name: room_name)
          if @user.save 
            redirect_to rooms_path(room)
          end
        end  
      else
        room = Room.find_by(name: params[:channel][:name])
        if room 
          render json: room, status: 201
        else
          room = @user.rooms.build(name: params[:channel][:name])
          room.name = room.name.split.join('-')
          if @user.save 
            render json: room, status: 201
          else 
            render json: room, status: :bad_request
          end
        end
      end
    end 

    def show 
      room = Room.friendly.find(params[:id])
      @message = Message.new
      respond_to do |format|
        format.html
        format.json { render :json => room.to_json }
      end
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