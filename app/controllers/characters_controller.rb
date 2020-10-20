class CharactersController < ApplicationController

    before_action :authenticate_user!
    before_action :set_world
    before_action :set_character, except: [:index, :new, :create, :show, :destroy]

    def index
        redirect_to worlds_path(@worlds)
    end

    def new
        @character = @world.characters.build
    end

    def show
        set_character
    end

    def create
        @character = Character.new(character_params)
        @character.user_id = current_user.id

        if @character.save
            redirect_to world_character_path(@character.world, @character)
          else 
            render 'new'
          end 
    end
  

    def edit
       @character = Character.find(params[:id])
    end

    def update
        @character = Character.find(params[:id])
        @character.user_id = current_user.id

        if @character.update
            redirect_to world_character_path(@character.world, @character)
          else 
            render 'edit'
          end 
    
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

    def set_world
        @world = World.find(params[:id])
    end

    def set_character
        @character = Character.find(params[:id])
    end


end
