class Plot < ApplicationRecord

    belongs_to :world

    validates :title, presence: true, uniqueness: true
end
