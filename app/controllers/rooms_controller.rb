class RoomsController < ApplicationController 
    before_action :find_user 
    skip_before_action :verify_authenticity_token#, except: [:show]
    
    def index
      @rooms = Room.all
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
        if !room.nil?
          redirect_to home_path
        else 
          room_name = 'kit' + SecureRandom.alphanumeric
          room = Room.new(name: room_name)
          contact.rooms << room 
          @user.rooms << room 
          contact.save 
          @user.save
          room.save
          redirect_to home_path
        end 
      else 
        room = Room.find_by(name: params[:channel][:name])
        if room 
          @user.rooms << room 
          @user.save
          render json: room, status: 201
        else
          room = Room.new(name: params[:channel][:name])
          room.name = room.name.split.join('-')
          @user.rooms << room
          room.save
          if @user.save 
            render json: room, status: 201
          else 
            render json: room, status: :bad_request
          end
        end
      end
    end 

    def show 
      room = Room.friendly.find_by(name: params[:id])
      render json: room, status: 201
    end 

    def edit 

    end 

    def destroy 
      if !params[:id].empty? || !params[:id].nil?
        room = Room.find_by(name: params[:id])
        if @user.rooms.include?(room)
          @user.rooms.delete(room)
          binding.pry
          redirect_to home_path 
        end  
      else 
        redirect_to home_path 
      end
    end

    private 

    def room_params 
        params.require(:room).permit(:name)
    end

end