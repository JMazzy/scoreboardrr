class MatchesController < ApplicationController
  def index
    if (params[:game_id])
      @matches = Game.find_by(id: params[:game_id]).matches
    else
      @matches = Match.all
    end
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if (@match.save)
      flash[:success] = "Match saved successfully."
      redirect_to :matches
    else
      flash[:error] = "Sorry, the match could not be saved."
      render "new"
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if (@match.update(match_params))
      flash[:success] = "Match saved successfully."
      redirect_to :matches
    else
      flash[:error] = "Sorry, the match could not be saved."
      render "edit"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    if (@match.destroy)
      flash[:success] = "Match deleted successfully."
      redirect_to :matches
    else
      flash[:error] = "Sorry, the match could not be deleted."
      render "index"
    end
  end

  private
  def match_params
    params.require(:match).permit(:game_id, team_ids: [])
  end
end
