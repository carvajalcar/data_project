class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :statistics, :classification]

    def index
      @teams = Team.all
    end
  
    def show
    end
  
    def statistics
      @statistics = @team.players.map(&:statistics).flatten
    end
  
    def classification
      @classification = @team.classification
    end
  
    private
  
    def set_team
      @team = Team.find(params[:id])
    end
end
