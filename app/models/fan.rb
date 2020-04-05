class Fan < ApplicationRecord
    has_many :teams, through: :sports
    has_many :sports
end
