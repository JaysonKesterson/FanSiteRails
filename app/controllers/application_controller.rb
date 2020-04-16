class ApplicationController < ActionController::Base
    helper_method :current_fan, :logged_in
    helper_method :basketball_teams, :baseball_teams, :football_teams
    helper_method :my_basketball_teams, :my_baseball_teams, :my_football_teams, :my_diehard_teams
    

    def current_fan
        @current_fan ||= Fan.find_by(id: session[:fan_id])
    end

    def logged_in
        if !session[:fan_id]
            redirect_to signin_path
        end
    end

    def basketball_teams
        @basketball_teams = Team.where(sport: "Basketball")
        @basketball_teams.each do |team|
            team.fancount = team.fans.count
            team.save
        end
        @basketball_teams_ordered = @basketball_teams.order(fancount: :desc)
    end

    def baseball_teams
        @baseball_teams = Team.where(sport: "Baseball")
        @baseball_teams.each do |team|
            team.fancount = team.fans.count
            team.save
        end
        @baseball_teams_ordered = @baseball_teams.order(fancount: :desc)
    end

    def football_teams
        @football_teams = Team.where(sport: "Football")
        @football_teams.each do |team|
            team.fancount = team.fans.count
            team.save
        end
        @football_teams_ordered = @football_teams.order(fancount: :desc)
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
