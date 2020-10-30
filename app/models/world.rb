class World < ApplicationRecord
    belongs_to :user

    has_many :characters, :dependent => :destroy
    accepts_nested_attributes_for :characters

    has_many :plots, :dependent => :destroy
    accepts_nested_attributes_for :plots

    validates :name, presence: true, uniqueness: true

#most plots in a world
def self.most_plots
   joins(:plots).group("worlds.id").order("COUNT(*) DESC").select("worlds.*").limit(1)
end

def self.search(search)
    if search
        world = World.find_by(name: search)
        if world
            self.where(world_id: world)
        else
            World.all
        end
    else
        World.all
    end
end 

end 
