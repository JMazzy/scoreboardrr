class ScoresController < ApplicationController
  def index
    if (params[:match_id])
      @scores = Score.where(match_id: params[:match_id])
    else
      @scores = Score.all
    end
  end

  def edit
    @score = Score.find(params[:id])
  end

  def update
    @score = Score.find(params[:id])
    if (@score.update(score_params))
      redirect_to :match_scores
    else
      render "edit"
    end
  end

  private
  def score_params
    params.require(:score).permit(:match_id, :team_id, :score)
  end
end
