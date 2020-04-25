class ApplicationController < ActionController::Base
    helper_method :current_fan, :logged_in
    helper_method :my_basketball_teams, :my_baseball_teams, :my_football_teams, :my_diehard_teams
    

    def current_fan
        @current_fan ||= Fan.find_by(id: session[:fan_id])
    end

    def logged_in
        if !session[:fan_id]
            redirect_to signin_path
        end
    end

    def my_basketball_teams
        @my_basketball_teams = current_fan.teams.where(sport: "Basketball")
    end

    def my_baseball_teams
        @my_baseball_teams = current_fan.teams.where(sport: "Baseball")
    end

    def my_football_teams
        @my_football_teams = current_fan.teams.where(sport: "Football")
    end

    def my_diehard_teams
        @die_hard_teams = []
        if current_fan 
            current_fan.fan_teams.where(die_hard_fan: true).each do |team|
            @team = Team.find_by(id: team.team_id)
            @die_hard_teams << @team
            end
        end
        @die_hard_teams
    end
end
