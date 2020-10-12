class World < ApplicationRecord
    #belongs_to :user
    #has_many :characters
    #has_many :plots

    validates :name, presence: true, uniqueness: true
end
