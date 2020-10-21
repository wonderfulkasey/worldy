class Plot < ApplicationRecord

    belongs_to :world

    validates :title, presence: true
end
