class TeamsController < ApplicationController
    before_action :logged_in, only:[:new, :create]

    def new
        @team = Team.new
        @team.fan_teams.build(die_hard_fan: false)
    end

    def create
        @team = Team.find_by(teamname: params[:team][:teamname], sport: params[:team][:sport]) || Team.new(team_params) 
        if @team.valid?
                if @team.id != nil
                    if !current_fan.teams.include?(@team)
                        current_fan.teams << @team
                        FanTeam.last.update(die_hard_fan: params[:team][:fan_teams_attributes]["0"]["die_hard_fan"])
                        redirect_to fan_path(current_fan)
                    else
                        @team = Team.new
                        @team.errors.add(:teamname, ": You are already a fan of this team!")
                        render :new
                    end
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

    def delete
        @fanteam = FanTeam.where(fan_id: current_fan.id, team_id: params[:id])
        current_fan.fan_teams.destroy(@fanteam)
        redirect_to fan_path(current_fan)
    end

    private


    def team_params
        params.require(:team).permit(:teamname, :city, :sport, fan_teams_attributes:[:die_hard_fan, :fan_id])
    end
end
