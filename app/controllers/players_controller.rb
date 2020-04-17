class PlayersController < ApplicationController
    before_action :logged_in, only:[:create, :new, :edit, :update, :delete]
    def new
        @player = Player.new(team_id: params[:team_id])
      end

    def create
            @team = Team.find_by(id: params[:player][:team_id])
            if @player = Player.find_by(playername: params[:player][:playername], position: params[:player][:position])
                @team.players << @player
                redirect_to team_players_path(@team)
            else
                @player = Player.new(player_params)
                if @player.valid?
                    @team.players.create(player_params)
                    redirect_to team_players_path(@team)
                else
                render :new
            end
        end
    end

    def show
    end

    def index
        @team = Team.find_by(id: params[:team_id])
        @players = @team.players
    end

    def edit
        @player = Player.find_by(id: params[:id])
    end

    def update
        @player = Player.find_by(id: params[:id])
        if @player.update(player_params)
            redirect_to team_players_path
        else 
            render :edit
        end
    end

    def destroy
        @player = Player.find_by(id: params[:id])
        @player.destroy
        redirect_to team_players_path
    end 


    private

    def player_params
        params.require(:player).permit(:playername, :position, :team_id)
    end

end
