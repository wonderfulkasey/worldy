class PlotsController < ApplicationController

    before_action :authenticate_user!
    before_action :set_world
    before_action :set_plot, except: [:index, :new, :create, :show, :destroy]


    def index
        redirect_to worlds_path(@worlds)
    end

    def new
        @plot = @world.plots.build
    end
    
    def show
        set_plot
    end

    def create
        @plot = Plot.new(plot_params)
        
        if @plot.save
            redirect_to world_plot_path(@plot.world, @plot)
          else 
            render 'new'
          end 
        end

    def edit
       @plot = Plot.find(params[:id])
    end

    def update
        @plot = Plot.find(params[:id])

        if @plot.update(plot_params)
            redirect_to worlds_path(@worlds)
        else
           render 'edit'
        end
    end

    def destroy
        @plot = Plot.find(params[:id])
        @plot.destroy

        redirect_to world_plot_path(@plot.world, @plot)
    end

    private 

    def plot_params
        params.require(:plot).permit(
            :title,
            :description,
            :user_id,
            :world_id
        )
    end

    def set_world
        @world = World.find_by(id:params[:world_id])
    end

end
