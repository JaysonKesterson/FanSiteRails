class FanteamsController < ApplicationController
    before_action :logged_in
    def new
        @fanteam = FanTeam.new
    end
    
    def create
        @fanteam = FanTeam.new(fanteam_params) 
            if @fanteam.save
                    redirect_to fan_path(current_fan)
            else
                render :new
            end
    end

    def edit
        @fanteam = FanTeam.find_by(fan_id: current_fan.id, team_id: params[:team_id])
    end

    def update
        @fanteam = FanTeam.find_by(fan_id: current_fan.id, team_id: params[:team_id])
        @fanteam.update(fanteam_params)
        redirect_to fan_path(current_fan)
    end

    def destroy
         @fanteam = FanTeam.where(fan_id: current_fan.id, team_id: params[:team_id])
        current_fan.fan_teams.destroy(@fanteam)
        redirect_to fan_path(current_fan)
    end

end

private

def fanteam_params
    params.require(:fan_team).permit(:team_id, :fan_id, :die_hard_fan)
end