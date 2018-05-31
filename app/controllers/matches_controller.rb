class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)
    if (@match.save)
      redirect_to :matches
    else
      render "new"
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if (@match.update(match_params))
      redirect_to :matches
    else
      render "edit"
    end
  end

  def destroy
    @match = Match.find(params[:id])
    if (@match.destroy)
      redirect_to :matches
    else
      render "index"
    end
  end

  private
  def match_params
    params.require(:match).permit(:game_id, team_ids: [])
  end
end
