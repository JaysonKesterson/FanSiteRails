class TeamsController < ApplicationController
    before_action :logged_in, only:[:new, :create, :delete, :existing_teams, :add]

    def new
        @team = Team.new
        @team.fan_teams.build(die_hard_fan: false)
    end

    def create
            @team = Team.new(team_params)
            if @team.valid?
                if @team = Team.find_by(teamname: params[:team][:teamname], sport: params[:team][:sport])
                    current_fan.teams << @team
                    FanTeam.last.update(die_hard_fan: params[:team][:fan_teams_attributes]["0"]["die_hard_fan"])
                    redirect_to fan_path(current_fan)
                else
                    @team = Team.create(team_params)
                    redirect_to fan_path(current_fan)
                end
            else
                render :new
            end
    end

    def show
        @team = Team.find_by_id(params[:id])
    end

    # def edit
    #     @team = Team.find_by_id(params[:id])
    # end

    # def update
    #     @team = current_fan.teams.find_by_id(params[:id])
    #     @team.update(team_params)
    #     redirect_to team_path(@team)
    # end

    def delete
        @fanteam = FanTeam.where(fan_id: current_fan.id, team_id: params[:id])
        current_fan.fan_teams.destroy(@fanteam)
        redirect_to fan_path(current_fan)
    end

    def existing_teams
        @team = Team.new
        @fanteam = FanTeam.new
        @team.fan_teams.build(die_hard_fan: false)
    end 

    def add
        @team = Team.new
        @fanteam = FanTeam.new(fan_id: params[:team][:fan_teams_attributes]["0"][:fan_id], team_id: params[:team][:id])
        if @fanteam.save
        FanTeam.last.update(die_hard_fan: params[:team][:fan_teams_attributes]["0"]["die_hard_fan"])
        redirect_to fan_path(current_fan)
        else
            @team.fan_teams.build(die_hard_fan: false)
            render :existing_teams
        end
    end

    private


    def team_params
        params.require(:team).permit(:teamname, :city, :sport, fan_teams_attributes:[:die_hard_fan, :fan_id])
    end
end
