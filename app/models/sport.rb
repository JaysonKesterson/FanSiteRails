class Sport < ApplicationRecord
    has_many :fans, through: :teams
    has_many :teams
end
