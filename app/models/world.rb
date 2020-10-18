class World < ApplicationRecord
    #belongs_to :user

    #has_many :characters, :dependent => :destroy

    #has_many :plots, :dependent => :destroy

    validates :name, presence: true, uniqueness: true

#most plots in a world
#def self.most_plots
#    joins(:plots).group("worlds.id").order("COUNT(*) DESC").select("worlds.*").limit(1)
#end

end
