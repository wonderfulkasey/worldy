class PlotsController < ApplicationController

    before_action :set_world
    #, only: [:index, :new, :create, :show]

    def index
        redirect_to worlds_path(@worlds)
    end

    def new
        @plot = @world.plots.build
    end
    
    def show
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

end
