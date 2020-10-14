class WorldsController < ApplicationController

    def index
        @worlds = World.all
   end

   def show
   end 

def new
    @world = World.new
end

def create
    @world = current_user.worlds.build(world_params)
 
end 

def edit 
    @world = World.find(params[:id])
end 

def update
    @world = World.find(params[:id])
end

def destroy
    @world = World.find(params[:id])
      @world.destroy

      redirect_to worlds_path
end 

private 

def world_params
    params.require(:world).permit(
        :name,
        :description,
        :user_id
    )
end

end
