class WorldsController < ApplicationController

    def index
        @worlds = World.all
   end

   def show
   end 

   def character
    @character = Character.find(params[:character_id])
    render template: 'characters/show'
end

def plot
    @plot = Plot.find(params[:plot_id])
    render template: 'plots/show'
end

def new
    @world = World.new
end

def create
end 

def edit 
    @world = World.find(params[:id])
end 

def update
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
        :genre,
        :description,
        :aesthetic,
        :user_id
    )
end

end
