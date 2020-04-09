class TeamsController < ApplicationController
    def new
        @team = Team.new
        @team.fan_teams.build(die_hard_fan: false)
    end

    def create
        if @team = Team.find_by(teamname: params[:team][:teamname], sport: params[:team][:sport]) 
            current_fan.teams << @team
            redirect_to fan_path(current_fan)
        else
            binding.pry
            current_fan.teams.create(team_params)
            redirect_to fan_path(current_fan)
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

    # def delete
    # end

    private

    def team_params
        params.require(:team).permit(:teamname, :city, :sport, fan_teams_attributes:[:die_hard_fan, :fan_id])
    end
end
