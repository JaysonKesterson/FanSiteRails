class Fan < ApplicationRecord
    has_secure_password
    has_many :fan_teams
    has_many :teams, through: :fan_teams
end
