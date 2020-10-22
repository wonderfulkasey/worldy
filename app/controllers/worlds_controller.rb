class WorldsController < ApplicationController

    before_action :authenticate_user!, except: [:not_found, :internal_error]
    
    def index
        @worlds = World.all
   end

   def new
     @world = World.new
   end

    def home 
    end 

   def show
    if params[:id] == "most-plots"
        @world = World.most_plots.first

    else  
        @world = World.find(params[:id])

    end
    @characters = @world.characters
    @plots = @world.plots
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

def not_found
    respond_to do |format|
      format.html { render status: 404 }
    end
  end

  def internal_error
    respond_to do |format|
      format.html { render status: 500 }
    end
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
