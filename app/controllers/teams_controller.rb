class TeamsController < ApplicationController
    before_action :set_team, only: [:show, :statistics, :classification]

    def index
      @search = params[:search]
      @search_by = params[:search_by]
      @teams = Team.all
  
      if @search.present? && @search_by.present?
        case @search_by
        when 'name'
          @teams = @teams.where('name LIKE ?', "%#{@search}%")
        when 'city'
          @teams = @teams.where('city LIKE ?', "%#{@search}%")
        when 'all'
          @teams = @teams.where('name LIKE ? OR city LIKE ?', "%#{@search}%", "%#{@search}%")
        end
      end
  
      @no_results = @teams.empty?
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



