class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if (@team.save)
      redirect_to :teams
    else
      render "new"
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if (@team.update(team_params))
      redirect_to :teams
    else
      render "edit"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if (@team.destroy)
      redirect_to :teams
    else
      render "show"
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
