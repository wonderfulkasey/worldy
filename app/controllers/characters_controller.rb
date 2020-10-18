class CharactersController < ApplicationController

    #before_action :authenticate_user!
    before_action :set_world

    def index
        redirect_to worlds_path(@worlds)
    end

    def new
        @character = @world.characters.build
    end

    def show
    end

    def create
        @character = Character.new(character_params)
        
        if @character.save
            redirect_to world_character_path(@character.world)
          else 
            render 'new'
          end 
    end
  

    def edit
       @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
    end

    def destroy
        @character = Character.find(params[:id])
        @character.destroy
        
        redirect_to world_character_path(@character.world)
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
