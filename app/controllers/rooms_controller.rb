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
        contact = User.find_by(name: params[:user_name])
        room = Room.all.find do |room|
          contact.rooms.include?(room) && @user.rooms.include?(room) 
        end
        if room 
          render json: room, status: 201
        else 
          room_name = '#' + SecureRandom.alphanumeric
          room = Room.create(name: room_name)
          contact.rooms << room 
          @user.rooms << room 
          contact.save 
          @user.save
          render json: room, status: 201  
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