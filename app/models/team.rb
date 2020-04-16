class Team < ApplicationRecord
    has_many :players
    has_many :fan_teams
    has_many :fans, through: :fan_teams
    accepts_nested_attributes_for :fan_teams
    validates :teamname, presence: true
    validates :sport, presence: true
    validates :city, presence: true
end
