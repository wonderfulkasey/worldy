class PlotsController < ApplicationController

    def index
        redirect_to worlds_path(@worlds)
    end

    def new
        @plot = @world.plots.build
    end
    
    def show
    end

    def create
    end

    def edit
       @plot = Plot.find(params[:id])
    end

    def update
    end

    def destroy
        @plot = Plot.find(params[:id])
        @plot.destroy

        redirect_to plots_path 
    end

    private 

    def plot_params
        params.require(:plot).permit(
            :title,
            :importance,
            :description,
            :user_id,
            :world_id
        )
    end

end
