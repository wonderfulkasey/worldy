class Character < ApplicationRecord
    belongs_to :world

    validates :name, presence: true
end
