class ApplicationController < ActionController::Base
    helper_method :current_fan
    helper_method :basketball_teams
    helper_method :baseball_teams
    helper_method :football_teams
    helper_method :my_basketball_teams
    helper_method :my_baseball_teams
    helper_method :my_football_teams
    

    def current_fan
        @current_fan ||= Fan.find_by(id: session[:fan_id])
    end

    def basketball_teams
        @basketball_teams = Team.where(sport: "Basketball")
    end

    def my_basketball_teams
        @my_basketball_teams = current_fan.teams.where(sport: "Basketball")
    end

    def baseball_teams
        @baseball_teams = Team.where(sport: "Baseball")
    end

    def my_baseball_teams
        @my_baseball_teams = current_fan.teams.where(sport: "Baseball")
    end

    def football_teams
        @football_teams = Team.where(sport: "Football")
    end

    
    def my_football_teams
        @my_football_teams = current_fan.teams.where(sport: "Football")
    end
end
