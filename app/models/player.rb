class Player < ApplicationRecord
    belongs_to :team
    validates :playername, presence: true, uniqueness: true
    validates :position, presence: true
end
