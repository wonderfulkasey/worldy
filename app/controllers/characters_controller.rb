class CharactersController < ApplicationController

    def index
        redirect_to worlds_path(@worlds)
    end

    def show
    end

    def new
        @character = @world.characters.build
    end

    def create
      
    end
  

    def edit
       @character = Character.find(params[:id])
    end

    def update
    end

    def destroy
        @character = Character.find(params[:id])
        @character.destroy
#redirect
    end

    private 

    def character_params
        params.require(:character).permit(
            :name,
            :type,
            :species,
            :description,
            :user_id,
            :world_id
        )
    end

end
