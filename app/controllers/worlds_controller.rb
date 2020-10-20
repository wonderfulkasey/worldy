class WorldsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_world, except: [:index, :new, :create, :show, :destroy, :profile]
    before_action :set_plot, except: [:index, :new, :create, :show, :destroy, :edit, :update, :profile]
    before_action :set_character, except: [:index, :new, :create, :show, :destroy, :edit, :update, :profile]


    def index
        @worlds = World.all
   end

   def new
    @world = World.new
end

   def show
    if params[:id] == "most-plots"
        @world = World.most_plots.first

    else  
        set_world

    end
    @characters = @world.characters
    @plots = @world.plots
   end 


def character
    @character = Character.find(params[:character_id])
    render template: 'characters/show'
end

def plot
    @plot = Plot.find(params[:plot_id])
    render template: 'plots/show'
end


def create
    @world = current_user.worlds.build(world_params)

    if @world.save
        redirect_to world_path(@world)
    else
       render 'new'
    end 
end 

def edit 
    @world = World.find(params[:id])
end 

def update
    @world = World.find(params[:id])

    if @world.update(world_params)
        redirect_to world_path(@world)
    else
       render 'edit'
    end 
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
