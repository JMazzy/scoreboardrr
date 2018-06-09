class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if (@team.save)
      flash[:success] = "The team was saved successfully."
      redirect_to :teams
    else
      flash.now[:error] = "Sorry, we couldn't save that team."
      render "new"
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    if (@team.update(team_params))
      flash[:success] = "The team was saved successfully."
      redirect_to :teams
    else
      flash.now[:error] = "Sorry, we couldn't save that team."
      render "edit"
    end
  end

  def destroy
    @team = Team.find(params[:id])
    if (@team.destroy)
      redirect_to :teams
      flash[:success] = "The team was deleted successfully."
    else
      flash.now[:error] = "Sorry, we couldn't delete that team."
      render "show"
    end
  end

  private
  def team_params
    params.require(:team).permit(:name)
  end
end
