class Team < ApplicationRecord
    has_many :players
    has_many :fan_teams
    has_many :fans, through: :fan_teams
    accepts_nested_attributes_for :fan_teams
    validates :teamname, presence: true
    validates :sport, presence: true
    validates :city, presence: true

    def self.basketball_teams
        @basketball_teams = Team.where(sport: "Basketball")
        @basketball_teams.each do |team|
            team.fancount = team.fans.count
            team.save
        end
        @basketball_teams_ordered = @basketball_teams.order(fancount: :desc)
    end

    def self.baseball_teams
        @baseball_teams = Team.where(sport: "Baseball")
        @baseball_teams.each do |team|
            team.fancount = team.fans.count
            team.save
        end
        @baseball_teams_ordered = @baseball_teams.order(fancount: :desc)
    end

    def self.football_teams
        @football_teams = Team.where(sport: "Football")
        @football_teams.each do |team|
            team.fancount = team.fans.count
            team.save
        end
        @football_teams_ordered = @football_teams.order(fancount: :desc)
    end

    
end
