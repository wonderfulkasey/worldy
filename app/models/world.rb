class World < ApplicationRecord
    belongs_to :user

    has_many :characters, :dependent => :destroy
    accepts_nested_attributes_for :characters

    has_many :plots, :dependent => :destroy
    accepts_nested_attributes_for :plots

    validates :name, presence: true, uniqueness: true


    def self.search(search)
        if search
            world = World.find_by(name: search)
            if world 
                self.where(world_id: world)
        else
            @worlds = World.all
        end 
    else 
        @worlds = World.all 
        end
    end 

#most plots in a world
def self.most_plots
   joins(:plots).group("worlds.id").order("COUNT(*) DESC").select("worlds.*").limit(1)
end



end 
