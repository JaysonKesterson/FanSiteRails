class TeamsController < ApplicationController
    def new
        @team = Team.new
    end

    def create
        @team = Team.create(team_params)
        @team.fans << current_fan
        redirect_to team_path(@team)
    end

    def show
        @team = Team.find_by_id(params[:id])
    end

    private

    def team_params
        params.require(:team).permit(:teamname, :city, :sport)
    end
end
